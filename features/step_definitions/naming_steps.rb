When(/^I fill in the form with "([^"]*)" on the name page$/) do |arg1|
  fill_in('name1', :with => arg1)
end

Then(/^I should see the placing ship page$/) do
  '/place_ship1'
end