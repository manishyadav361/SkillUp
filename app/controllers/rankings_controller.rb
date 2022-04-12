class RankingsController < ApplicationController
    
    before_action :authorize 

    def index
       @rankings = Rating.order('rating desc')
    end
    
end
