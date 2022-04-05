class ProfileController < ApplicationController
    def current_user_id
        {id: session[:user_id].to_i}
    end

    def index 
        @user = User.find(current_user_id[:id])
        @rating = @user.rating
        @participated_in = Participant.where(user_id: current_user_id[:id]) 
    end
end
