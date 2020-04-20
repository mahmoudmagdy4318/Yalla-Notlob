class FriendsController < ApplicationController
    def new
      puts "heeeheheheh"
    end
    def index
        @users = current_user.friendships
    end
      def create

        # puts params["friend"]["friend_user_id"]
        @added_user = User.find_by(email: params["friend"]["friend_user_id"])
        if @added_user
          if !current_user.friendships.include? @added_user
            Friend.create(user_id: current_user.id, friend_user_id: @added_user.id)
            redirect_to friends_path, notice: @added_user.email.concat(" Has Been Added New Friend")
          else
            redirect_to friends_path, notice: "This User Already Your Friend"
          end
        else
          redirect_to friends_path, notice: "Sorry User Not Exist"
        end
      end
      def destroy
        @friendship =Friend.find_by_sql ["delete FROM friendships WHERE user_id = ? AND friend_user_id = ?", current_user.id, params[:id]]
          redirect_to friends_path, notice: "Has Been Deleted" 
    end
end
