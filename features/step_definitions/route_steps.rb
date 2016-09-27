Given(/^I am at (.+)$/) do |page_name|
  visit route_to(page_name)
end

When(/^I go to (.+)$/) do |page_name|
  visit route_to(page_name)
end
