module DiscussionsHelper
  def discussion_delete(discussion)
    render './components/delete_discussion_button', discussion: discussion if current_user == discussion.author
  end
end
