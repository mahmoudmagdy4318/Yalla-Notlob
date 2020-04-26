class HomeController < ApplicationController
  def index
    @orderAll = Order.all.order(:created_at).reverse
    
  end

end
