Then /^the output should say the file "([^"]*)" was created$/ do |file|
  Then "the output should match /create(.+)#{file}/"
end

Then /^the file "([^"]*)" should contain a copyright notice for "([^"]*)"$/ do |file, name|
  year = Time.now.year
  Then "the file \"#{file}\" should contain \"Copyright (c) #{year}, #{name}\""
end

Then /^I should see the generic help output$/ do
  Then "the output should contain \"lickjen help [TASK]\""
  Then "the output should contain \"lickjen list\""
  Then "the output should contain \"lickjen bsd\""
  # TODO: add more conditions when we have more templates
end
