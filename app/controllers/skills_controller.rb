class SkillsController < ApplicationController

    before_action :authorize 
    def current_user_id
        {id: session[:user_id]}
    end

    def create
        @user = User.find(current_user[:id])
        @skills = @user.skills.create(skills_params)

        if @skills.save
            redirect_to profile_path
        end
    end

    def update
        @user = User.find(current_user[:id])
        @skill = @user.skills.find(params[:id])
        @skill.update(skills_params)
    end

    private

    def skills_params
        params.require(:skill).permit(:name,:experience)
    end
end
