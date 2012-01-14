require "hashie"

Given /^database has one feed$/ do |table|
  feed = Hashie::Mash.new(table.rows_hash)
  Database.feed feed
end

When /^I visit the api$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I can get the feed$/ do
  pending # express the regexp above with the code you wish you had
end
