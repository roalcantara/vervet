module ProfileValidatorConcern
  extend ActiveSupport::Concern

  included do
    before_action :verify_profile, if: -> { user_signed_in? }

    private

    def verify_profile
      redirect_to [:edit, current_user] unless current_user.profile_complete?
    end
  end
end
