class AddressesController < ApplicationController
   
    before_action :authorize
   
    def create
        @task = Task.find(params[:task_id])
        @address = @task.addresses.create(address_params)

        redirect_to task_path(@task)
    end

    def destroy
        @task = Task.find(params[:task_id])
        @address = @task.address.find(params[:id])

        @address.destroy
        redirect_to task_path(@task), status: 303
    end

    private
    def address_params
        params.require(:address).permit(:link,:title)
    end
end
