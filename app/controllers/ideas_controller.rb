class IdeasController < ApplicationController
 
    def update
        @idea = Task.find(params[:id])
        @idea.update(approved:true)
            redirect_to admin_path
    end

    def destroy
        @idea = Task.find(params[:id])
        @idea.destroy
            redirect_to admin_path
    end
end
