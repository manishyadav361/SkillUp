class AdminController < ApplicationController
  
     before_action :isAdmin
    def index
    @user = User.find(session[:user_id].to_i)
        @query = params[:search]
        if !@query
          @tasks = Task.where(:approved => true)
        else  
        @tasks =Task.where("name LIKE ?" , "%" + params[:search] + "%" )
        end
   end

   def users
    @user = User.find(session[:user_id].to_i)

    @query = params[:search]
        if !@query 
          @users = User.where(:isAdmin => false || nil)
        else
          @users = User.where(:isAdmin => false || nil).and(User.where("name LIKE ?" , "%" + params[:search] +  "%"))
        end
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
    @user = User.find(session[:user_id].to_i)

     @ideas = Task.where(:approved => false)
   end 
   def user_idea 
     @admin = User.find(session[:user_id].to_i)
     @idea = Task.find(params[:id])
   end

  
end
