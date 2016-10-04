require_relative '../base'

module Pages
  module Users
    class Account < Pages::Base
      def path(user)
        edit_user_path(user)
      end

      def visit(user)
        page.visit path(user)
      end
    end
  end
end
