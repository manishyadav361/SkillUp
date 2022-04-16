class CommentsController < ApplicationController
    
    before_action :authorize  
    
    def current_user_id
        defaults = { user_id: session[:user_id].to_i}
    end 

  

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params.merge(current_user_id))
    respond_to do |format|

        if @comment.save
            comment = Comment.new
            format.turbo_stream
            format.html { redirect_to @post }
        else 
            format.html {render :new , status: :unprocessable_entity}
        end
    end
    end



    private 

    def comment_params
        params.require(:comment).permit(:description)
    end 
    
end
