class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @post = Post.new
    @followers = @user.followers
  end

  def index
    @post = Post.new
    @comment = Comment.new
    timeline_posts
    who_to_follow
    @user = current_user
  end

  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followed_id: @user.id).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def who_to_follow
    following_array = current_user.followees.map { |friend| friend }
    @user_timeline = User.where.not(id: following_array << current_user).all
  end

  def timeline_posts
    following_array = current_user.followees.map { |friend| friend }
    @timeline_posts ||= Post
      .where(author: following_array.compact << current_user)
      .all
      .ordered_by_most_recent
      .includes(:author)
  end
end
