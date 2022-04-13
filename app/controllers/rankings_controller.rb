class RankingsController < ApplicationController
    
    before_action :authorize 

    def index
        @query= params[:search]
        if @query
            @rankings = Rating.where(user: User.where("name LIKE ?" , "%" + params[:search] + "%" ))
           
        else
            @rankings = Rating.order('rating desc')
        end
    end
    
end
