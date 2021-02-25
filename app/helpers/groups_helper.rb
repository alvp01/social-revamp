module GroupsHelper
  def join_leave(grp)
    if grp.members.include?(current_user)
      render './components/leave_button', grp: grp
    else
      render './components/join_button', grp: grp
    end
  end
end
