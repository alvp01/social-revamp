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
end
