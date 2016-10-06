module Auth0Concern
  extend ActiveSupport::Concern
  CURRENT_USER_KEY = :current_user_id
  OMNIAUTH_KEY = 'omniauth.auth'.freeze

  included do
    def authenticate
      user = find_or_create_from_auth0(request.env[OMNIAUTH_KEY])
      session[CURRENT_USER_KEY] = user.id
      user
    end

    def user_signed_in?
      session.include?(CURRENT_USER_KEY) && session[CURRENT_USER_KEY].present?
    end

    def current_user
      User.find(session[CURRENT_USER_KEY]) if user_signed_in?
    end

    def current_user?(user)
      session[CURRENT_USER_KEY] == user.id if user_signed_in?
    end

    def logout
      reset_session
    end

    private

    def find_or_create_from_auth0(userinfo)
      User.where(provider: userinfo[:provider],
                 uid: userinfo[:uid]).first_or_create! name: userinfo[:info][:name],
                                                       avatar: userinfo[:info][:image]
    end
  end
end
