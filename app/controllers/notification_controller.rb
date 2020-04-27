class NotificationController < ApplicationController

  
    respond_to :js, :json, :html
    def nots
      Notification.where(user_id: current_user.id).update_all(seen:true)
      render json: {success: "success"}
    end

    def join 
        @id = params[:id]
        @userId=params[:user_id]

        @username=User.find(@userId).name
        @orderOwner=Notification.find(@id).order.owner
        @order=Notification.find(@id).order_id



        @notification=Notification.create(body: @username + " has accepted to join your order",
            user_id: @orderOwner, order_id: @order , btn: "show", seen: "false")
        ActionCable.server.broadcast 'notification_channel', content: @notification

        Notification.where(id: @id).update_all(btn: "show")
        render json: {success: @order}
    
    end    
  
end