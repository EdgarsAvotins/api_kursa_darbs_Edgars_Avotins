Given(/^I log in with an existing user$/) do
  @tests.test_request_creation.login_with_default_user
  @tests.test_request_creation.change_to_default_project
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
  @tests.test_request_creation.add_request('Login')
  @tests.test_request_creation.add_request('Projects')
end

Then(/^two requests have been added$/) do
  @tests.test_request_creation.validate_added_requests
end

And(/^I setup my default project$/) do
  @tests.test_request_creation.add_environment('PREPROD')
  @tests.test_request_creation.add_global_variables
  @tests.test_request_creation.add_collection('Login')
  @tests.test_request_creation.add_collection('Projects')
  @tests.test_request_creation.add_request('Login')
  @tests.test_request_creation.add_request('Projects')
end

When(/^I create a test case '(.*)'$/) do |name|
  @tests.test_case_creation.add_test_case(name)
end

And(/^add requests to this case$/) do
  @tests.test_case_creation.add_both_requests_to_case
end

Then(/^this case has been created with requests$/) do
  @tests.test_case_creation.validate_test_case_created
end
