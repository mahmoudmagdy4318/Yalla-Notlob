class OrderDetailsController < ApplicationController

    def new
    end

    def create
        @orderDetails= OrderDetail.create(order_id: params[:order_id] ,user_id: current_user.id,item: params[:item],
             amount: params[:amount],price: params[:price],comment: params[:comment])
        if @orderDetails.save

            @notification=Notification.create(body: current_user.name + " has invited you to his order",
                user_id: 2, order_id: 1 , btn: "join")
            ActionCable.server.broadcast 'notification_channel', content: @notification

            redirect_to request.referrer
        else
            render 'new'
        end 
    end

    def destroy
        @detail= OrderDetail.find_by_id(params[:id])
        @detail.destroy
        redirect_to request.referrer
    end
end
