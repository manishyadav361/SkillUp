class PostsController < ApplicationController
    
    before_action :authorize , except: [:index]

    def current_user_id
        defaults = { user_id: session[:user_id].to_i}
    end 

def index
    @posts = Post.all
end
    def create 
        # @post = Post.create(post_params.merge(current_user_id)) 
        # redirect_to root_path
        @post = Post.new(post_params.merge(current_user_id))
        respond_to do |format|
            if @post.save
                format.turbo_stream
                format.html { redirect_to post_url(@post) }
            else 
                format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@post)}_form" , partial: "posts/form" , locals: { post: @post }  )  }
                format.html { render :new , status: :unprocessable_entity }
            end
        end

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
