class TestLogin
  def initialize(endpoints)
    @endpoints = endpoints
    @user = User.new
  end

  def test_login
    @login_response = @endpoints.login(email: @user.email,
                                       password: @user.password)
  end

  def validate_login_response
    code = @login_response.code
    assert_equal(code, 200, 'Bad response code')
    response_hash = JSON.parse(@login_response)
    assert_equal(response_hash['email'], @user.email, 'Incorrect response email')
  end
end
