module Pages
  class Base
    include Capybara::DSL
    include Rails.application.routes.url_helpers
    include RackSessionAccess::Capybara
    include WebMock::API
    include Rack::Test::Methods

    def app_name
      Rails.application.class.parent_name
    end
  end
end
