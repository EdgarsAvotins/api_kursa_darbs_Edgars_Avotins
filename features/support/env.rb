Before do
  api = Api.new
  endpoints = Endpoints.new(api)
  @tests = TestObjects.new(endpoints)
end

After do
  # Delete created stuff
end
