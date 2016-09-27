class BasePage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def app_name
    Rails.application.class.parent_name
  end
end
