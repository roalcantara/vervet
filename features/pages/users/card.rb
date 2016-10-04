require_relative '../base'

module Pages
  module Users
    class Card < Pages::Base
      def initialize(source)
        @source = source
      end

      def name
        @source.find('strong').text
      end

      def username
        @source.find('strong').text
      end
    end
  end
end
