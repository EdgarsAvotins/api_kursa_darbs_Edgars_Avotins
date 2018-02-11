class TestRequestCreation
  def initialize(endpoints)
    @endpoints = endpoints
    @user = Users.default_user
    @default_project_name = Project.default_project_name
    @other_project_name = Project.other_test_project_name
  end

  def login_with_default_user
    login_response = @endpoints.login_endpoint.login(email: @user.email, password: @user.password)
    validate_login_response(login_response)
    @user.set_cookie(login_response.cookies)
  end

  def change_to_default_project
    id = get_project_id(@default_project_name)
    response = @endpoints.project_endpoint.change_active_project(id, @user.cookie)
    response = @endpoints.project_endpoint.get_active_project(id, @user.cookie)
  end

  def validate_login_response(login_response)
    code = login_response.code
    assert_equal(code, 200, login_response) # TODO: change to raise
    response_hash = JSON.parse(login_response)
    assert_equal(response_hash['email'], @user.email, response_hash) # TODO: change to raise
  end

  def add_environment(env_name)
    response = @endpoints.environment_endpoint.add_environment(env_name, @user.cookie)
    response_hash = JSON.parse(response)
    @env_id = response_hash['id']
  end

  def add_global_variables
    other_project_id = get_project_id(@other_project_name)
    @endpoints.environment_endpoint.add_global_var(@env_id, '$user', @user.email, @user.cookie)
    @endpoints.environment_endpoint.add_global_var(@env_id, '$password', @user.password, @user.cookie)
    @endpoints.environment_endpoint.add_global_var(@env_id, '$project_id', other_project_id, @user.cookie)
  end

  def get_project_id(project_name)
    response = @endpoints.project_endpoint.get_projects(@user.cookie)
    response_hash = JSON.parse(response)
    correct_id = nil
    response_hash.each do |project|
      if project['name'] == project_name
        correct_id = project['id']
        break
      end
    end
    raise 'This project does not exist' if correct_id.nil?
    return correct_id
  end

  def add_collection(name)
    response = @endpoints.collection_endpoint.add_collection(name, @user.cookie)
    puts response
    response_hash = JSON.parse(response)
  end

  def add_request(collection_name)
    if collection_name == 'Login'
      id = get_collection_id(collection_name)
      payload = Request.login_payload(id)
      response = @endpoints.collection_endpoint.add_request_to_collection(id, @user.cookie, payload: payload)
    elsif collection_name == 'Projects'
      collection_id = get_collection_id(collection_name)
      project_id = get_project_id(@other_project_name)
      payload = Request.change_active_project_payload(collection_id, project_id, @user.cookie)
      response = @endpoints.collection_endpoint.add_request_to_collection(id, @user.cookie, payload: payload)
    else
      raise "Invalid collection name: #{collection_name}"
    end
  end

  def get_collection_id(collection_name)
    response = @endpoints.collection_endpoint.get_collections(@user.cookie)
    response_hash = JSON.parse(response)
    response_hash.each do |collection|
      return collection['id'] if collection['name'] == collection_name
    end
    raise "Collection '#{collection_name}' not found"
  end
end
