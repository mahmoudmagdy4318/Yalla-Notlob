class FriendsController < ApplicationController
    def new
    end
    def index
        @users = User.all
      end
      def add_friend
        @added_user = User.find_by(email: params[:user_email])
        if @added_user
          if !current_user.friends.include? @added_user
            @friendship = current_user.friendships.build(:friend_id => @added_user.id)
            @friendship.save
            redirect_to friendships_path, notice: @added_user.email.concat(" Has Been Added Successfully")
          else
            redirect_to friendships_path, notice: "Sorry This User Already Exist"
          end
        else
          redirect_to friendships_path, notice: "Sorry User Not Exist"
        end
      end
      def destroy
        @friendship = current_user.friendships.find(params[:id])
        @friendship.destroy
        respond_to do |format|
          format.html { redirect_to friendships_path, notice: @friendship.user.email.concat(" Has Been Destroyed")  }
          format.json { head :no_content }
        end
      end
end
