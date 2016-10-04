Before do
  @home_page = Pages::Home::Index.new
end

Then(/^I should see the app name on the page title$/) do
  expect(@home_page.title).to include(@home_page.app_name)
end
