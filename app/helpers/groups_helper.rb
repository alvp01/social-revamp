module GroupsHelper
  def join_leave_delete(grp)
    if grp.creator == current_user
      render './components/delete_group_button', grp: grp
    elsif grp.members.include?(current_user)
      render './components/leave_button', grp: grp
    else
      render './components/join_button', grp: grp
    end
  end

  def group_discussion(group, discussion)
    render './discussions/discussion_form', current_group: group, discussion: discussion if (group.members.include?(current_user) or group.creator == current_user)
  end
end
