class ProfileController < ApplicationController
  
    before_action :authorize
  
    def current_user_id
        {id: session[:user_id].to_i}
    end

    def index 
        @user = User.find(params[:id])
        @rating = @user.rating
        @participated_in = Participant.where(user_id: params[:id]) 
    end

end
