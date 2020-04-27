class HomeController < ApplicationController

  def index
    @orders = Order.all.order(:created_at).reverse
  end

  respond_to :js, :json, :html
  def nots
    Notification.where(user_id: current_user.id).update_all(seen:true)
    render json: {success: "success"}
  end

end
