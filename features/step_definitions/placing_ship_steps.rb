Given(/^I am on the place ship page$/) do
  visit('/game')
end

When(/^I enter "([^"]*)"$/) do |input|
  fill_in('coords', :with => input)
end

When(/^select "([^"]*)"$/) do |orientation|
  select orientation, :from => "direction"
end

Then(/^I should see a ship appear on the board/) do
  expect(page).to have_content 'BBBB'
end