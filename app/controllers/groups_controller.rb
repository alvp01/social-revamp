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
