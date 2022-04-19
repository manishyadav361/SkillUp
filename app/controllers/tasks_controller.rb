class TasksController < ApplicationController
    
    before_action :authorize 
    
    def current_user_id
        {id: session[:user_id].to_i}

    end 

    def redirect_logic
        @user = User.find_by(current_user_id)

        if @user.isAdmin
            redirect_to admin_path
        else
            redirect_to tasks_path(@task)
        end
    end

    def index
        @participants = Participant
        @user = User.find(current_user_id[:id])
        @query = params[:search]
        if @query
          
            @tasks = Task.where("name LIKE ?" , "%" + params[:search] + "%").and(Task.where(:approved => true))
        else
            @tasks = Task.where(:approved => true)
        end
    end
    
    def show
        @user = User.find_by(current_user_id)
        @task = Task.find(params[:id])
        @addresses = @task.addresses
        @taskImage = @task.taskImage
        @docs = @task.docs
        @participant = @task.participants.where(user_id: current_user_id[:id]).first
        @submission = @task.submissions.where(user_id:current_user_id[:id]).first
    end

    def new
        @task = Task.new
    end

    def create
        @user = User.find(current_user_id[:id])
        @task = Task.new({:user_id => @user.id}.merge(task_params))
       
        if @user.isAdmin 
            @task.approved = true
            if @task.save 
                respond_to do |format|
                    format.turbo_stream
                    format.html { redirect_to task_path(@task) }
                end
            else 
                redirect_to admin_path
            end
        else
            @task.approved = false
            if @task.save 
                respond_to do |format|
                    format.turbo_stream
                    format.html { redirect_to task_path(@task) }
                end
            else  
                render :new
            end
        end
       

    end

    def edit
        @task = Task.find(params[:id])
    end

    def update

        @task = Task.find(params[:id])
        @user = User.find(current_user_id[:id])

        if @task.update({:user_id => @user.id}.merge(task_params))
           respond_to do |format|
                format.turbo_stream 
                format.html { redirect_to @task }
           end
        else
            render :edit , status: :unprocessable_entity
        end

    end

    def approve_idea
        @idea = Task.find(params[:id])

        if @idea.update(:approved => true)
            redirect_to "/admin"
        end
    end

    def destroy
        @task = Task.find(params[:id])
        
        @task.destroy

        redirect_to tasks_path
    end

    private 

    def task_params
        params.require(:task).permit(:name,:description,:time,:approved,:reward,:taskImage, docs:[])
    end
end
