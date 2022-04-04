class CommentsController < ApplicationController
    before_action :authorize  
    
    def current_user_id
        defaults = { user_id: session[:user_id].to_i}
    end 

    def new
        @post = Post.find(params[:post_id])
        @comments = @post.comments.new
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params.merge(current_user_id))

        if @comment.save
            redirect_to root_path
        else 
            render "new", status: :unprocessable_entity
        end
    end



    private 

    def comment_params
        params.require(:comment).permit(:description)
    end 
    
end
