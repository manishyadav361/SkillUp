class SubmissionsController < ApplicationController

    before_action :authorize 

    def redirect_logic(submission,task)

        @user = User.find(session[:user_id].to_i)

        if @user.isAdmin
            redirect_to "/admin/tasks/#{@task.id}"
        else
            redirect_to task_path(@task)
        end

    end

    def current_user_id
        {user_id: session[:user_id].to_i}
    end
   
    def new 
        @task = Task.find(params[:task_id])
        @submission = @task.submissions.new
    end

    def edit 
        @task = Task.find(params[:task_id])
        @submission = @task.submissions.where(current_user_id).first
    end

    def create
        @task = Task.find(params[:task_id])
       
        @submission = @task.submissions.where(current_user_id).first
      
        if !@submission
            
          @submissions = @task.submissions.create({:user_id => current_user_id[:user_id],:status => "pending"}.merge(submission_params))

          redirect_to task_path(@task)
        end

    end

    def update

        @task = Task.find(params[:task_id])
      
        @submission = @task.submissions.find(params[:id])

        if @submission.update(submission_params)
                redirect_logic(@submission,@task)
        end

    end

    private 

    def submission_params
        params.require(:submission).permit(:description,:status,:title,docs:[])
    end

end
