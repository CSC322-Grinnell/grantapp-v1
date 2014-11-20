Given /the following admins exist/ do |admins|
  admins.hashes.each do |admin|
    AdminUser.create!(admin)
  end
end

Then(/^I should see a form for "(.*?)"$/) do |arg1|
  page.should have_field(arg1)
end

Then(/^I should see a button with "(.*?)"$/) do |arg1|
  page.should have_button(arg1)
end

When(/^I fill form for "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, :with => arg2
end

When(/^I click "(.*?)"$/) do |link|
  click_on(link)
end

Then(/^I should see a field for "(.*?)"$/) do |field|
  page.should have_field(field) 
end


