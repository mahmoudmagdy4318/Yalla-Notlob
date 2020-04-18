class FriendsController < ApplicationController
    def new
    end
    def index
        @users = User.all
      end
     
    private
   
end
