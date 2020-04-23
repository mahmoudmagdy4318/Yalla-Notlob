class OrderDetailsController < ApplicationController

    def new
    end

    def create
        @orderDetails= OrderDetail.create(order_id: params[:order_id] ,user_id: 1,item: params[:item],
             amount: params[:amount],price: params[:price],comment: params[:comment])
        if @orderDetails.save
            redirect_to request.referrer
        else
            render 'new'
        end 
    end
end
