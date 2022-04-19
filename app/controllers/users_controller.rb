class UsersController < ApplicationController
    

    def current_user_id 
        { :id => session[:user_id].to_i}
    end

    def user_action_format(user)
        
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
        @query = params[:search]
        @user = User.find(params[:user_id])
        @user.disabled = true

        if @user.save(:validate => false)
            respond_to do |format| 
                format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@user)}_action" , partial: "admin/user_action" , locals: { user: @user } ) }
                format.html { redirect_to @user }
            end 
        end
    end

        def enable_user
            @query = params[:search]
            @user = User.find(params[:user_id])
            @user.disabled = false
            if @user.save(:validate => false)
              respond_to do |format| 
                format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@user)}_action" , partial: "admin/user_action" , locals: { user: @user } ) }
                format.html {redirect_to @user }
              end
            end
        end

   

    private 
    
    def user_params
        params.require(:user).permit(:name,:email,:password,:about,:isAdmin,:password_confirmation,:profileImage)
    end
end
