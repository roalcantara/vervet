module Auth0Helper
  def logged_in_as(user)
    page.set_rack_session(current_user_id: user.id)
  end
end

World(Auth0Helper)
