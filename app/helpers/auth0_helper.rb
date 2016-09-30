module Auth0Helper
  include Auth0Concern

  LOGOUT_PATH = 'https://roalcantara.auth0.com/v2/logout?returnTo=http://vervet.herokuapp.com/auth/destroy'.freeze

  def destroy_session_path
    LOGOUT_PATH
  end
end
