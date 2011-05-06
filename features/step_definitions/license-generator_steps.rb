Then /^the output should say the file "([^"]*)" was created$/ do |file|
  Then "the output should match /create(.+)#{file}/"
end

Then /^the file "([^"]*)" should contain a copyright notice for "([^"]*)"$/ do |file, name|
  year = Time.now.year
  Then "the file \"#{file}\" should contain \"Copyright (c) #{year}, #{name}\""
end
