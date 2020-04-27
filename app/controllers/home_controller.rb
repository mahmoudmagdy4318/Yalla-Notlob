class HomeController < ApplicationController
  def index
    sql="select users.name,orders.restaurant,orders.created_at from users inner join orders on users.id=orders.owner"
    sql2="select f.user_id,users.id,users.name,orders.restaurant,orders.created_at from users inner join orders on users.id=orders.owner inner join friendships f on f.friend_user_id=users.id"
    @orders=ActiveRecord::Base.connection.execute(sql).reverse
    @friends=ActiveRecord::Base.connection.execute(sql2).reverse
    
    # @orders = Order.all.order(:created_at).reverse
  end

  respond_to :js, :json, :html
  def nots
    Notification.where(user_id: current_user.id).update_all(seen:true)
    render json: {success: "success"}
  end

end
