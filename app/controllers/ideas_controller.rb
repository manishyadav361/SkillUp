class IdeasController < ApplicationController
 
    def update
        @idea = Task.find(params[:id])
        if @idea.update(approved:true)
            respond_to do |format|
               format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@idea)}")  }
               format.html { redirect_to @idea } 
            end
        end
    end
    def show
        @idea = Task.find(params[:id])
    end

    def destroy
        @idea = Task.find(params[:id])
        if @idea.destroy
            respond_to do |format|
                format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@idea)}") }
                format.html { redirect_to @idea }
                format.json { head :no_content }
            end
        end
    end
end
