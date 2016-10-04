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

      def search_by(criteria)
        search_field.set(criteria)
        submit_search_form
        Pages::Users::Index.new
      end

      private

      def logout
        stub_request(:post, AUTH0_LOGOUT).to_return(status: [200, 'OK'])
        header.find('.logout')
      end

      def login
        header.find('.auth0')
      end

      def search_field
        search_form.find('.input-field input')
      end

      def submit_search_form
        execute_script("$('nav .search-form').submit()")
      end

      def search_form
        header.find('nav .search-form')
      end

      def header
        find('header')
      end
    end
  end
end
