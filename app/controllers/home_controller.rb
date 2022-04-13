class HomeController < ApplicationController
   
    def current_user
        session[:user_id].to_i != 0
    end
    def index 
        if current_user
            @user=  User.find(session[:user_id].to_i)
        end
        @task = Task.last
        @query = params[:search]
        if !@query
            @posts = Post.all.reverse_order
        else 
            @posts = Post.where("description LIKE ?" , "%" + params[:search] +  "%").or(Post.where(user: User.where("name LIKE ?" , "%" + params[:search] +  "%"))).reverse_order
        end
    end

end
