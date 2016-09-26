require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

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
