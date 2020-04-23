class OrdersUsersController < ApplicationController
    def show
    
    end

    def destroy
        @record= OrderUser.find_by_id(params[:id])
        @record.destroy
        redirect_to request.referrer
    end    
end
