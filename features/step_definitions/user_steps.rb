Before do
  @home_page = Pages::Home::Index.new
  @account_page = Pages::Users::Account.new
end

Given(/^I am not authenticated$/) do
  @home_page.visit
end

When(/^I authenticate with an incompleted profile user$/) do
  @auth0_modal = @home_page.header.click_login
  @auth0_modal.submit
end

Then(/^I should be redirected to the account page to complete my profile$/) do
  expect(@home_page.header).to be_logged_in
  expect(page.current_path).to match @account_page.path(User.last)
end

Given(/^I am authenticated$/) do
  logged_in_as FactoryGirl.create(:user)
  @home_page.visit
end

When(/^I log out$/) do
  @home_page.header.click_logout
end

Then(/^I should not be authenticated$/) do
  expect(page.current_path).to match @home_page.path
  expect(@home_page.header).to_not be_logged_in
end
