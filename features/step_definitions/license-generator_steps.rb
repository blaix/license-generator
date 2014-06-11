Then /^the output should say the file "([^"]*)" was created$/ do |file|
  steps %{Then "the output should match /create(.+)#{file}/"}
end

Then /^the file "([^"]*)" should contain a copyright notice for "([^"]*)"$/ do |file, name|
  content = "Copyright (c) #{Time.now.year}, #{name}"
  check_file_content(file, content, true)
end

Then /^I should see the generic help output$/ do
  assert_partial_output("licgen help [COMMAND]", all_output)
  assert_partial_output("licgen list", all_output)
  assert_partial_output("licgen bsd", all_output)
  assert_partial_output("licgen mit", all_output)
end
