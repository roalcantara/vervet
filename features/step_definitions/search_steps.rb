Before do
  @home_page = Pages::Home::Index.new
end

When(/^I search for users by name$/) do
  @criteria = User.last.name
  @users_page = @home_page.header.search_by(@criteria)
end

Then(/^I should see a list of users found by the search$/) do
  expect(page).to have_current_path(/users/)
  expect(@users_page.list.collect(&:name)).to include @criteria
end

When(/^I clean up the search field$/) do
  @users_page = @home_page.header.search_by(nil)
end

Then(/^I should see a list of all users$/) do
  expect(page).to have_current_path(/users/)
  expect(@users_page.list.size).to eq User.count
end
