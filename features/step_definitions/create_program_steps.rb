Given /the following programs exist/ do |programs|
  programs.hashes.each do |p|
    Program.create!(p)
  end
end

When(/^I create a program with name "(.*?)" and form url "(.*?)"$/) do |name, url|
  Program.create!(:name => name, :form_url => url)
end

Then(/^a program with name "(.*?)" should exist$/) do |name|
  Program.find_by_name(name).should_not == nil
end

Then(/^I should see a link with "(.*?)" to "(.*?)"$/) do |link, url|
  page.should have_link(link, :href => url)
end

Then(/^I should not see a link with "(.*?)"$/) do |link|
  page.should_not have_link(link)
end

