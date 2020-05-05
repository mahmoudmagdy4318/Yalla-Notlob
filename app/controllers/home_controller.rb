class HomeController < ApplicationController
  def index
    sql2="select f.user_id,users.id,users.name,orders.restaurant,orders.created_at from users inner join orders on users.id=orders.owner inner join friendships f on f.friend_user_id=users.id order by orders.created_at desc"
    @orders=Order.where(owner:current_user.id).reverse_order
    @friends=ActiveRecord::Base.connection.execute(sql2)
    
    # @orders = Order.all.order(:created_at).reverse
  end

  respond_to :js, :json, :html
  def nots
    Notification.where(user_id: current_user.id).update_all(seen:true)
    render json: {success: "success"}
  end

end
