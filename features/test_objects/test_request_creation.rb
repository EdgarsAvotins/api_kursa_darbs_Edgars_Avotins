class TestRequestCreation
  def initialize(endpoints)
    @endpoints = endpoints
    @user = User.new
  end

  def login_with_default_user
    p 'HELLO'
    login_response = @endpoints.login_endpoint.login(email: @user.email, password: @user.password)
    validate_login_response(login_response)
    @user.set_cookie(login_response.cookies)
    p @user.cookie
  end

  def validate_login_response(login_response)
    code = login_response.code
    assert_equal(code, 200, login_response)
    response_hash = JSON.parse(login_response)
    assert_equal(response_hash['email'], @user.email, response_hash)
  end
end
