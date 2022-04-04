class SubmissionsController < ApplicationController
   
    def index
        @task = Task.find(params[:task_id])
        @submission = @task.submissions.where(userId:1).first
    end

    def new 
        @task = Task.find(params[:task_id])
        @submission = @task.submissions.new
    end

    def edit 
        @task = Task.find(params[:task_id])
        @submission = @task.submissions.where(userId:1).first
    end

    def create
        @task = Task.find(params[:task_id])
        @submission = @task.submissions.where(userId:1).first
        if @submission
          redirect_to task_path(@task)
        else 
          @submissions = @task.submissions.create({:userId => 1 }.merge(submission_params))
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
