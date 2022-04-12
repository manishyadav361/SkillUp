class ParticipantsController < ApplicationController

    before_action :authorize

    
    def current_user_id
        {user_id: session[:user_id].to_i}
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
        @rating = @user.rating

        if @participant
            redirect_to task_path(@task)
        else 
            @participant = @task.participants.create(current_user_id)
            if @rating
                @user.rating.update(rating:@rating.rating + 1)
            else
                @user.create_rating(rating:1)
            end
            redirect_to task_path(@task)
        end
    end
end
