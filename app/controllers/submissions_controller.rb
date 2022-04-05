class SubmissionsController < ApplicationController

    before_action :authorize 

    def current_user_id
        {userId: session[:user_id].to_i}
    end
   
    def index
        @task = Task.find(params[:task_id])
        @submission = @task.submissions.where(current_user_id).first
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
        if @submission
          redirect_to task_path(@task)
        else 
          @submissions = @task.submissions.create(submission_params.merge(current_user_id))
          redirect_to task_path(@task)
        end
    end

    def update
        @task = Task.find(params[:task_id])
        @submission = @task.submissions.find(params[:id])

        if @submission.update(submission_params)
            redirect_to task_path(@task)
        end

    end

    private 

    def submission_params
        params.require(:submission).permit(:description,:status,:title,docs:[])
    end

end
