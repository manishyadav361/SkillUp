class LikesController < ApplicationController
    before_action :authorize  
    def current_user_id
         {user_id: session[:user_id].to_i}
    end 


    def create
        @post = Post.find(params[:post_id])
        @like_count = @post.likes.count

        @like_exist = @post.likes.where(current_user_id).first

        if @like_exist
        
        else
            @like = @post.likes.create(current_user_id)
            redirect_to root_path
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @like_exist = @post.likes.where(current_user_id).first
        

        if @like_exist
            @like_exist.destroy
            redirect_to root_path
        end
    end


end
