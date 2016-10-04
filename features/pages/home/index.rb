require_relative '../base'

module Pages
  module Home
    class Index < Pages::Base
      def path
        root_path
      end

      def visit
        page.visit path
      end

      def header
        Pages::Home::Header.new
      end
    end
  end
end
