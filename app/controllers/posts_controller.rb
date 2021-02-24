class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |f|
      if @post.save
        f.html { redirect_to '', notice: 'Post created!' }
      else
        f.html { redirect_to '', notice: 'Post could not be created!' }
      end
    end
  end

  def destroy
    Post.find(params[:id]).delete
    flash[:success] = 'Post deleted'
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:text, :AuthorId)
  end
end
