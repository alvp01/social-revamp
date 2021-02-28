module UsersHelper
  def profile_post(usr, post)
    render './posts/post_form', post: post if usr == current_user
  end

  def profile_owner(usr)
    render './users/user_profile', user: usr unless usr == current_user
  end

  def delete_post(post)
    render './components/delete_post_button', post: post if current_user == post.author
  end

  def delete_post_comment(post, comment)
    render './components/delete_post_comment_button', post: post, comment: comment if current_user == comment.author
  end
end
