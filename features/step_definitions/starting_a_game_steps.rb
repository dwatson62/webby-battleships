Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I click "([^"]*)"$/) do |link_text|
  click_link(link_text)
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

When(/^I enter my name, "([^"]*)"$/) do |name|
  fill_in('name1', :with => name)
end

When(/^I click on "([^"]*)"$/) do |arg1|
  click_on(arg1)
end