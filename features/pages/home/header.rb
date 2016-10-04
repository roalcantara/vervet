require_relative '../base'

module Pages
  module Home
    class Header < Pages::Base
      AUTH0_LOGOUT = 'https://roalcantara.auth0.com/v2/logout'.freeze

      def click_login
        login.click
        Pages::Auth0::Modal.new
      end

      def click_logout
        logout.click
        visit destroy_auth0_path
      end

      def logged_in?
        has_selector? '.profile', visible: true
      end

      private

      def logout
        stub_request(:post, AUTH0_LOGOUT).to_return(status: [200, 'OK'])
        header.find('.logout')
      end

      def login
        header.find('.auth0')
      end

      def header
        find('header')
      end
    end
  end
end
