class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def show
    @current_group = Group.find(params[:id])
    @members = @current_group.members
    @creator = @current_group.creator
    @discussion = Discussion.new
    discussion_timeline
  end

  def create
    @new_group = Group.new(group_params)
    if @new_group.save
      current_user.created_groups << @new_group
      redirect_to group_path(@new_group), notice: 'Group Created'
    else
      redirect_to root_path, notice: 'Group could not be created'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.delete
      redirect_to root_path, notice: 'Group deleted successfully'
    else
      flash.now[:alert] = 'Group could not be deleted'
      redirect_back(fallback_location: group_path(@group.id))
    end
  end

  def join
    @group = Group.find(params[:id])
    registration = GroupRegistration.create(group_id: @group.id, member_id: current_user.id)
    current_user.group_registrations << registration
    @group.registrations << registration
    redirect_back(fallback_location: root_path)
  end

  def leave
    @group = Group.find(params[:id])
    GroupRegistration.find_by(group_id: @group.id, member_id: current_user.id).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def group_params
    params.require(:group).permit(:creator_id, :group_name, :group_description)
  end

  def find_current_group
    Group.find(params[:id])
  end

  def discussion_timeline
    current_group = find_current_group
    creator = current_group.creator
    members_array = current_group.members.map { |group_member| group_member }
    @discussion_timeline ||= Discussion
      .where(author: members_array.compact << creator)
      .all
      .ordered_by_most_recent
      .includes(:author)
  end
end
