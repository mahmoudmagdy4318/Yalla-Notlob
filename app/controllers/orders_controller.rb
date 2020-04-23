class OrdersController < ApplicationController

    def show 
        @order=Order.find_by_id(params[:id])
        @orders=OrderDetail.where(order_id: params[:id])
        @invitedUsers=OrderUser.where(order_id: params[:id])
        @joinedUsers=OrderUser.where(order_id: params[:id], joined: true)
        @currentUsers=@invitedUsers
    end

    def showJoined
        @currentUsers=@joinedUsers
    end    
      
end
