class HomeController < ApplicationController
  def index
    @orders = Order.all.order(:created_at).reverse
  end

end
