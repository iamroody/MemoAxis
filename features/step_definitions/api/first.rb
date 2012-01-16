Given /^database has one feed$/ do |table|
  Database.feed table.hashes
end

When /^I visit the api$/ do
  visit_api_page
end

Then /^I can get the feed$/ do
  
end
