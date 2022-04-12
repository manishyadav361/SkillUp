class AdminController < ApplicationController
  
     before_action :isAdmin
  
   def index
        @tasks = Task.where(:approved => true)
   end

   def users
        @users = User.all
   end

   def task 
        @task = Task.find(params[:id])
        @user = User.find(session[:user_id].to_i)
   end

   def add_task 
    @task = Task.new
   end

   def update_task
        @task = Task.find(params[:id])
        @user = User.find(session[:user_id].to_i)
   end

   def submission_info
     @submission = Submission.find(params[:id])
     @user = @submission.user
     @task = @submission.task
   end

   def user_ideas 
     @ideas = Task.where(:approved => false)
   end 
   def user_idea 
     @admin = User.find(session[:user_id].to_i)
     @idea = Task.find(params[:id])
   end

   def update_user_idea 
     @task = Task.find(params[:id])

     if @task.update(:approved => true)
          redirect_to "/admin/userIdeas"
     end
   end

  
end
