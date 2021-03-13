class CommentsController < ApplicationController
  def create
    post_discuss = !params[:post_id].nil? ? Post.find(params[:post_id]) : Discussion.find(params[:discussion_id])
    @comment = post_discuss.comments.new(comment_params)
    @comment.author = current_user
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def show
    @comment = Comment.find(params[:comment_id])
  end

  def destroy
    Comment.find(params[:id]).delete
    flash[:success] = 'Comment deleted'
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
