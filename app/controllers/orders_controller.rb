class OrdersController < ApplicationController
    def new
    end
   
    def create
    end
    
    def index
        @orders = Order.all.paginate(page: params[:page],per_page:5);
        @invited=OrderUser.group(:order_id).count;
        @joined=OrderUser.group(:order_id,:joined).count;
    end

    def show 
        @order=Order.find_by_id(params[:id])
        @orders=OrderDetail.where(order_id: params[:id])
        @invitedUsers=OrderUser.where(order_id: params[:id])
        @joinedUsers=OrderUser.where(order_id: params[:id], joined: true)
    end  

    def destroy
        @order = Order.find(params[:id])
        @order.destroy
        redirect_to orders_path
    end

    def is_finished
        @order= Order.find(params[:id])
        @order.update(status:1)
        redirect_to orders_path
    end
      
end
