class HomeController < ApplicationController
   
    def current_user
        session[:user_id].to_i != 0
    end
    def index 
        if current_user
            @user=  User.find(session[:user_id].to_i)
        end
        @task = Task.last
        @posts = Post.all.reverse_order
    end

end
