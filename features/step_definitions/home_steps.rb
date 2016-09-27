Before do
  @page = BasePage.new
end

Then(/^I should see the app name on the page title$/) do
  expect(@page.title).to include(@page.app_name)
end
