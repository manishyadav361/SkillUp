class LikesController < ApplicationController
   
    before_action :authorize  
   
    def current_user_id
         {user_id: session[:user_id].to_i}
    end 

    def like_handler
       
    end


    def create
        @post = Post.find(params[:post_id])
        @like_exist = @post.likes.where(current_user_id).first

        if !@like_exist
            @like = @post.likes.new(current_user_id)
        if @like.save
            respond_to do |format|
                format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@post)}_likes", partial: "likes/likes" , locals: { post: @post } ) }
                format.html { redirect_to @post }
            end
        end
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @like_exist = @post.likes.where(current_user_id).first

        if @like_exist
          if @like_exist.destroy
            respond_to do |format|
                format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@post)}_likes", partial: "likes/likes" , locals: { post: @post } ) }
                format.html { redirect_to @post }
            end
          end
        end
    end


end
