class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def create
    @group = Group.create(name: params[:name], owner: current_user.id)

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_url, notice: 'successfully created.' }
      else
        format.html { redirect_to groups_url, notice: 'can`t create a new Group' }
      end
    end
  end
  def index
    @groups = Group.where(owner: current_user.id)
    @first_group = @groups.first()
    if @first_group
      @friends = GroupUser.where(group_id: @first_group.id)
    end
    @class="none"

  end
  def destroy
    GroupUser.where(group_id: params[:id]).destroy_all
    @groups =Group.delete_by(id: params[:id])
        redirect_to groups_path, notice: "Has Been Deleted" 

  end
  def show
    @group=Group.find(params[:id])
    @friends = GroupUser.where(group_id: params[:id])
    @groups = Group.where(owner: current_user.id)
    # redirect_to groups_path
  end
end
