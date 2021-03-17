module CommentsHelper
  def delete_discussion_comment(discussion, comment)
    path = './components/delete_discussion_comment_button'
    attrs = { discussion: discussion, comment: comment }

    render path, attrs if current_user == comment.author
  end
end
