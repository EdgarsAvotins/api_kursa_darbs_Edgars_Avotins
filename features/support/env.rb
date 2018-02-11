require 'test/unit'
include Test::Unit::Assertions

Before do
  p 'Clearing user data'
  Users.clear_data

  api = Api.new
  endpoints = Endpoints.new(api)
  @tests = TestObjects.new(endpoints)
end

After do
  @tests.test_request_creation.change_to_default_project
  @tests.afterhook.delete_created_data
end
