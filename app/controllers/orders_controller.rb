class OrdersController < ApplicationController
    def new
    end
   
    def create
    end
    
    def index
        @orders = Order.all
    end
end
