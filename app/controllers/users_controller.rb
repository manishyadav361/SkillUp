class UsersController < ApplicationController
    

    def current_user_id 
        { :id => session[:user_id].to_i}
    end

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        @user.email.downcase!

        if @user.save
            redirect_to login_path
        else 
            render :new , status: :unprocessable_entity
        end
    end

    def edit
        @user = User.find(current_user_id[:id])
    end

    def update

        @user = User.find(current_user_id[:id])
        
        if @user.update(user_params)
            respond_to do |format|
                format.turbo_stream 
                format.html { redirect_to @user }
            end
        else
            render :edit ,status: :unprocessable_entity
        end
    end

    def disable_user
        @user = User.find(params[:user_id])
        if !@user.disabled
            @user.disabled = true
            @user.save(:validate => false)
        else
            @user.disabled = false
            @user.save(:validate => false)

        end
        @query = params[:search]

        redirect_back(fallback_location:root_path)
    end
   

    private 
    
    def user_params
        params.require(:user).permit(:name,:email,:password,:about,:isAdmin,:password_confirmation,:profileImage)
    end
end
