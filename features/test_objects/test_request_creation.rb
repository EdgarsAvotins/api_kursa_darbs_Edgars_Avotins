class TestRequestCreation
  def initialize(endpoints)
    @endpoints = endpoints
    @user = Users.default_user
  end

  def login_with_default_user
    login_response = @endpoints.login_endpoint.login(email: @user.email, password: @user.password)
    validate_login_response(login_response)
    @user.set_cookie(login_response.cookies)
  end

  def validate_login_response(login_response)
    code = login_response.code
    assert_equal(code, 200, login_response)
    response_hash = JSON.parse(login_response)
    assert_equal(response_hash['email'], @user.email, response_hash)
  end

  def add_environment(env_name)
    response = @endpoints.environment_endpoint.add_environment(env_name, @user.cookie)
    response_hash = JSON.parse(response)
    @env_id = response_hash['id']
  end
end
