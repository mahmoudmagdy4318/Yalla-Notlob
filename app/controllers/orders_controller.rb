class OrdersController < ApplicationController
    def new
    end
   
    def create
    end
    
    def index
        @orders = Order.all.paginate(page: params[:page],per_page:5)
        @count=OrderUser.group(:order_id).count;
    end

    def show 
        @order=Order.find_by_id(params[:id])
        @orders=OrderDetail.where(order_id: params[:id])
        @invitedUsers=OrderUser.where(order_id: params[:id])
        @joinedUsers=OrderUser.where(order_id: params[:id], joined: true)
    end  
      
end
