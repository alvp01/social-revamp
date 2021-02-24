class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def index
    @user = current_user
  end

  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: home_path)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followed_id: @user.id).destroy
    redirect_back(fallback_location: home_path)
  end
end
