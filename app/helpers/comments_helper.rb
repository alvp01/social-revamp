module CommentsHelper
  def delete_discussion_comment(discussion, comment)
    render './components/delete_discussion_comment_button', discussion: discussion, comment: comment if current_user == comment.author
  end
end
