class PostsController < ApplicationController
    
    before_action :authorize , except: [:index]

    def current_user_id
        defaults = { user_id: session[:user_id].to_i}
    end 

    def  new 
        @post = Post.new
    end


    def create 
        @post = Post.create(post_params.merge(current_user_id)) 

        redirect_to root_path
    end

    def edit 
     @post = Post.find(params[:id])
    end

    def update 
        @post = Post.find(params[:id])
        @post = @post.update(post_params)
        
        redirect_to root_path
    end

   

    def destroy
        @post = Post.find(params[:id])

        if @post.destroy
            redirect_to root_path
        end
    end

    private
        def post_params
            params.require(:post).permit(:description,:image,docs:[])
        end
        
end
