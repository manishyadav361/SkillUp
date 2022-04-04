class HomeController < ApplicationController
    def index 
        @user =  User.first
        @task = Task.last
        if @task
            @participant = @task.participants.where(user_id:1).first
        end
        @posts = Post.all.reverse_order
    end

end
