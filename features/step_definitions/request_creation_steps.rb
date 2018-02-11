Given(/^I log in with an existing user$/) do
  @tests.test_request_creation.login_with_default_user
end

And(/^I add '(.*)' environment$/) do |env_name|
  @tests.test_request_creation.add_environment(env_name)
end

And(/^I add global variables$/) do
  @tests.test_request_creation.add_global_variables
end

And(/^I add login and projects collections$/) do
  @tests.test_request_creation.add_collection('Login')
  @tests.test_request_creation.add_collection('Projects')  
end

When(/^I add two requests$/) do

end

Then(/^two requests have been added$/) do

end
