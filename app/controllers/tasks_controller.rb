class TasksController < ApplicationController
    before_action :authorize , except: [:index,:show]
    
    def current_user_id
        {id: session[:user_id].to_i}

    end 

    def index
        @tasks = Task.all
        @participants = Participant
    end
    
    def show
        @user = User.find_by(current_user_id)
        @task = Task.find(params[:id])
        @addresses = @task.addresses
        @taskImage = @task.taskImage
        @docs = @task.docs
        @participant = @task.participants.where(current_user_id).first
        @submission = @task.submissions.where(current_user_id).first
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save 
            redirect_to tasks_path(@task)
        else 
            render :new , status: :unprocessable_entity
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to task_path(@task)
        else
            render :edit , status: :unprocessable_entity
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
