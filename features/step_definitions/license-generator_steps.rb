Then /^the output should say the file "([^"]*)" was created$/ do |file|
  step %{Then "the output should match /create(.+)#{file}/"}
end

Then /^the file "([^"]*)" should contain a copyright notice for "([^"]*)"$/ do |file, name|
  year = Time.now.year
  step %{Then "the file \"#{file}\" should contain \"Copyright (c) #{year}, #{name}\""}
end

Then /^I should see the generic help output$/ do
  steps %{
    Then "the output should contain \"licgen help [TASK]\""
    Then "the output should contain \"licgen list\""
    Then "the output should contain \"licgen bsd\""
    # TODO: add more conditions when we have more templates
  }
end
