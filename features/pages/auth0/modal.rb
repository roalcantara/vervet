require_relative '../base'

module Pages
  module Auth0
    class Modal < Pages::Base
      def submit
        visit callback_auth0_path
      end
    end
  end
end
