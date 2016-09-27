require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara-screenshot/cucumber'
require 'capybara/poltergeist'

# Capybara defaults to CSS3 selectors rather than XPath.
# If you'd prefer to use XPath, just uncomment this line and adjust any
# selectors in your step definitions to use the XPath syntax.
# Capybara.default_selector = :xpath

# Selenium configuration

# Chrome driver configuration
# Capybara.register_driver :chrome do |app|
#  Capybara::Selenium::Driver.new(app, browser: :chrome)
# end
# Capybara.javascript_driver = :chrome
# Capybara.default_driver = :chrome

# Firefox driver configuration
# Capybara.register_driver :firefox do |app|
#   Capybara::Selenium::Driver.new(app, browser: :firefox)
# end
# Capybara.javascript_driver = :firefox
# Capybara.default_driver = :firefox

# Poltergeist driver configuration
Capybara.default_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  options = {
    js_errors: false,
    timeout: 120,
    debug: false,
    phantomjs_options: ['--load-images=no', '--disk-cache=false'],
    inspector: true
  }
  Capybara::Poltergeist::Driver.new(app, options)
end
