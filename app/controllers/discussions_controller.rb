class DiscussionsController < ApplicationController
  def new
    @discussion = Post.new
  end

  def create
    @discussion = Discussion.new(discussion_params)
    current_group = Group.find(@discussion.group_id)
    @discussion.AuthorId = current_user.id
    @discussion.group_id = current_group.id
    if @discussion.save
      current_group.discussions << @discussion
      current_user.discussions << @discussion
      redirect_back(fallback_location: group_path(current_group.id))
    else
      redirect_back(fallback_location: group_path(current_group.id))
    end
  end

  private

  def discussion_params
    params.require(:discussion).permit(:text, :AuthorId, :group_id)
  end
end
