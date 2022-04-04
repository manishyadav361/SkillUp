class ParticipantsController < ApplicationController

    
    def current_user_id
        {user_id: session[:user_id].to_i}
    end 

    def index 
        @task = Task.find(params[:task_id])
        @participant = @task.participants.where(current_user_id)
        
    end
    def show 
        @user = User.where(current_user_id).first
        @task = Task.find(params[:task_id])
        @participant = @task.participants.where(current_user_id)
    end 
    def new 
        
    end
    def create
        @task = Task.find(params[:task_id])
        
        @participant = @task.participants.where(current_user_id).first
        @user = User.find(current_user_id[:user_id])

        if @participant
            redirect_to task_path(@task)
        else 
            @participant = @task.participants.create(current_user_id)
           
            redirect_to task_path(@task)
        end
    end
end
