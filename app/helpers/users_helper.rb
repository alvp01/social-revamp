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
end
