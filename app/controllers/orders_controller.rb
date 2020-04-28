class OrdersController < ApplicationController
    def new
        # friends1=Friend.where(friend_user_id: current_user.id)
        @friends=Friend.where(user_id: current_user.id)  
        # if friends1[0] && friends2[0]           
        #     @friends=friends1+friends2

        # elsif friends1[0]
        #     @friends=friends1

        # elsif friends2[0]
        #     @friends=friends2
        # else
        #     @friends=nil
        # end
        @group=Group.where(owner:current_user.id)

  
    end

    def create
        puts "alaa", params
        invited_friends=[]
        @order = Order.create(meal:params[:meal].to_i,restaurant:params[:restaurant],owner:current_user.id,status:0)
        @username=User.find(@order.owner).name
        if @order.save 
            orderId=@order.id
            if params[:invited_friends].length > 0 || params[:invited_groups]
                if params[:invited_friends]
                    invited_friends=params[:invited_friends].split(":").map!{|e| e.to_i}.to_set
                    puts "loloooooooooo",params[:invited_friends]
                    invited_friends.each {|friend|  
                        
                        OrderUser.create(order_id:orderId,user_id:friend)

                        @notification=Notification.create(body:@username  + " has invited you to join an order",
                        user_id: friend, order_id: orderId , btn: "join", seen: "false")
                        ActionCable.server.broadcast 'notification_channel', content: @notification
            
                }
                end
                if params[:invited_groups]
                    params[:invited_groups].each{ |group|
                        users=GroupUser.where(group_id:group.to_i)
                        
                        users.each{|user|
                            unless invited_friends.include?(user.user_id)
                                OrderUser.create(order_id:orderId,user_id:user.user_id)

                                @notification2=Notification.create(body:@username  + " has invited you to join an order",
                                user_id: user.user_id, order_id: orderId , btn: "join", seen: "false")
                                ActionCable.server.broadcast 'notification_channel', content: @notification2
        
                            end
                        }    
                    }
                end
                redirect_to @order
            else
                redirect_to new_order_path, alert: "please invite friends!"
            end
        else
            redirect_to new_order_path , alert: " order not saved!"
        end
        
    end 
    
    
    def index
        @orders = Order.all.paginate(page: params[:page],per_page:5);
        @invited=OrderUser.group(:order_id).count;
        @joined=OrderUser.group(:order_id,:joined).count;
    end

    def show 
        @checkOrder=OrderUser.where(order_id: params[:id], user_id: current_user.id).size
        if @checkOrder > 0 || Order.find(params[:id]).owner == current_user.id 
            @order=Order.find_by_id(params[:id])
            @orders=OrderDetail.where(order_id: params[:id])
            @invitedUsers=OrderUser.where(order_id: params[:id])
            @joinedUsers=OrderUser.where(order_id: params[:id], joined: true)
        else
            redirect_to home_index_path , alert: "You are not included in this order!"
        end      
    end  

    def destroy
        OrderUser.where(order_id:params[:id]).destroy_all
        Notification.where(order_id:params[:id]).destroy_all
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
