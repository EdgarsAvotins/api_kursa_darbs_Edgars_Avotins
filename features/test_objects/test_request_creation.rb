class TestRequestCreation
  def initialize(endpoints)
    @endpoints = endpoints
    @user = Users.default_user
    @project_name = Project.default_name
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

  def add_global_variables
    @endpoints.environment_endpoint.add_global_var(@env_id, 'user', @user.email, @user.cookie)
    @endpoints.environment_endpoint.add_global_var(@env_id, 'password', @user.password, @user.cookie)
    @endpoints.environment_endpoint.add_global_var(@env_id, 'project_id', get_default_project_id, @user.cookie)
  end

  def get_default_project_id
    response = @endpoints.project_endpoint.get_projects(@user.cookie)
    response_hash = JSON.parse(response)
    correct_id = nil
    response_hash.each do |project|
      if project['name'] == @project_name
        correct_id = project['id']
        break
      end
    end
    raise 'Default project does not exist' if correct_id.nil?
    return correct_id
  end

  def add_collection(name)
    response = @endpoints.collection_endpoint.add_collection(name, @user.cookie)
    puts response
  end
end
