module UsersHelper
  def profile_post(usr, post)
    render './posts/post_form', post: post if usr == current_user
  end

  def profile_owner(usr)
    render './users/user_profile', user: usr unless usr == current_user
  end
end
