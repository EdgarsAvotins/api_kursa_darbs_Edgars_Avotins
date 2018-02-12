Before do
  p 'Clearing user data'
  Users.clear_data

  api = Api.new
  endpoints = Endpoints.new(api)
  @tests = TestObjects.new(endpoints)
end

After do
  @tests.afterhook.delete_created_data
end
