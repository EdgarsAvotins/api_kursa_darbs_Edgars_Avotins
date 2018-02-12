class TestCaseCreation
  def initialize(endpoints)
    @endpoints = endpoints
    @user = Users.default_user
  end

  def add_test_case(name)
    payload = Case.create_payload(name: name)
    response = @endpoints.case_endpoint.add_case(@user.cookie, payload: payload)
    response_hash = JSON.parse(response)
    @case_id = response_hash['case_id']
    @case_name = name
  end

  def add_both_requests_to_case
    project_id = Request.get_used_project_id
    payload = Case.united_request_payload(project_id, @case_id, @user.cookie, name: @case_name)
    response = @endpoints.case_endpoint.add_request_to_case(@case_id, @user.cookie, payload: payload)
    @add_requests_to_case_response = response
  end

  def validate_test_case_created
    raise "Request: Login. Bad response code: #{code}\n#{response}" unless @add_requests_to_case_response.code == 204
  end
end
