class SkillsController < ApplicationController

    before_action :authorize 
    
    def current_user_id
        {id: session[:user_id]}
    end

    def new 
        @user = User.find(current_user[:id])
        @skills = @user.skills.new
    end


    def create
        @user = User.find(current_user[:id])
        @skill = @user.skills.new(skills_params)

        if @skill.save
            respond_to do |format|
                format.turbo_stream
                format.html { redirect_to skill_path(@skill) }
            end
        else  
            render :new , unprocessable_entity
        end
    end


    def update
        @user = User.find(current_user[:id])
        @skill = @user.skills.find(params[:id])
        @skill.update(skills_params)
    end

    def destroy
        @user = User.find(params[:user_id])
        @skill = @user.skills.find(params[:id])

        if @skill.destroy
            respond_to do |format|
                format.turbo_stream
                format.html { redirect_to @skill }
                format.json { head :no_content }
            end
        end
    end

    private

    def skills_params
        params.require(:skill).permit(:name,:experience)
    end
end
