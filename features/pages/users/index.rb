require_relative '../base'

module Pages
  module Users
    class Index < Pages::Base
      def path
        users_path
      end

      def visit
        page.visit path
      end

      def list
        all('.users .card-user').map do |card|
          Pages::Users::Card.new(card)
        end
      end
    end
  end
end
