module EditorsHelper
  def session_link
    if editor_signed_in?
      link_to "Sign Out", destroy_editor_session_path, :method => :delete
    else
      link_to "Sign In", new_editor_session_path
    end
  end
end
