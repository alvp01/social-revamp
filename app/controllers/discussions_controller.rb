class DiscussionsController < ApplicationController
  def create
    @discussion = Discussion.new(discussion_params)
    current_group = Group.find(@discussion.group_id)
    @discussion.AuthorId = current_user.id
    @discussion.group_id = current_group.id
    if @discussion.save
      current_group.discussions << @discussion
      current_user.discussions << @discussion
    end
    redirect_back(fallback_location: group_path(current_group.id))
  end

  def destroy
    Discussion.find(params[:id]).delete
    flash[:success] = 'Comment deleted'
    redirect_back(fallback_location: root_path)
  end

  private

  def discussion_params
    params.require(:discussion).permit(:text, :AuthorId, :group_id)
  end
end
