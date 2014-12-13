Given /the following programs exist/ do |programs|
  programs.hashes.each do |p|
    Program.create!(p)
  end
end

When(/^I create a program with name "(.*?)" and form url "(.*?)"$/) do |name, url|
  fill_in :program_name, :with => name
  fill_in :program_form_url, :with => url
  click_on('Submit')
end

Then(/^a program with name "(.*?)" should exist$/) do |name|
  Program.find_by_name(name).should_not == nil
end

Then(/^a program with name "(.*?)" should not exist$/) do |name|
  Program.find_by_name(name).should == nil
end

Then(/^I should see a link "(.*?)"$/) do |link|
  page.should have_link(link)
end

Then(/^I should see a link with "(.*?)" to "(.*?)"$/) do |link, url|
  page.should have_link(link, :href => url)
end

Then(/^I should not see a link with "(.*?)"$/) do |link|
  page.should_not have_link(link)
end

