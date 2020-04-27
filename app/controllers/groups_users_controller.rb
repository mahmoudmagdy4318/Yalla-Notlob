class GroupsUsersController  < ApplicationController
  def new
    puts "heeeheheheh"
  end
  def index
      @users = current_user.friendships
  end

    def create

      puts params
      @selected_group = Group.find_by(id: params[:id])
      @added_user = User.find_by(email: params[:user_email])
      if @added_user
      @isinGroup=GroupUser.where(user_id:@added_user.id,group_id:@selected_group.id)
      end
      if @added_user
        puts @isinGroup
        if @isinGroup.size ==0
          GroupUser.create(group_id: @selected_group.id, user_id: @added_user.id)
          redirect_to group_path(@selected_group), notice: @added_user.email.concat(" Has Been Added New Friend")
        else
          redirect_to group_path(@selected_group), notice: "This User Already In This Group"
        end
      else
        redirect_to group_path(@selected_group), notice: "Sorry User Not Exist"
      end
    end
    def destroy
      @selectedd_group = Group.find_by(id: params[:group][:group_id])
      puts "#############################", params[:group][:group_id],"*****", params,"*****","##################",params[:id] ,"###########"
      GroupUser.where(group_id: params[:group][:group_id],user_id:params[:id]).destroy_all
      GroupUser.delete(params[:id])
      # GroupUser.find_by_sql ["delete FROM group_users WHERE user_id = ? AND group_id = ?",params[:id].to_i, params[:group][:group_id].to_i]
        redirect_to group_path(@selectedd_group), notice: "Has Been Deleted" 
  end
end