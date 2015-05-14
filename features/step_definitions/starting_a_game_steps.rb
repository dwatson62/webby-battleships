Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I follow "([^"]*)"$/) do |link_text|
  click_link(link_text)
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page.has_content?(text)).to be_truthy
end