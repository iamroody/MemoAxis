Given /^database has one feed$/ do |table|
  Database.feed table.hashes
end

When /^I visit the api$/ do
  pending
end

Then /^I can get the feed$/ do
end
