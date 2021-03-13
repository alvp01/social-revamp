class PostsController < ApplicationController
  def create
    @post = current_user.posts.new(post_params)
    
      if @post.save
        flash.now[:notice] = 'Post created'
        redirect_back(fallback_location: root_path)
      else
        flash.now[:notice] = 'Post could not be created'
        redirect_back(fallback_location: root_path)
      end

  end

  def destroy
    if Post.find(params[:id]).delete
      flash.now[:notice] = 'Post deleted'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:notice] = 'Post could not be deleted'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, :AuthorId)
  end
end
