class PostsController < ApplicationController
  def create
    @post = current_user.posts.new(post_params)

    flash.now[:notice] = if @post.save
                           'Post created'

                         else
                           'Post could not be created'

                         end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    flash.now[:notice] = if Post.find(params[:id]).delete
                           'Post deleted'

                         else
                           'Post could not be deleted'

                         end
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:text, :AuthorId)
  end
end
