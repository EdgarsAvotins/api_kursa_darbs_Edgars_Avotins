class Afterhook
  def initialize(endpoints)
    @endpoints = endpoints
    @user = Users.default_user
  end

  def delete_created_data
    response = @endpoints.project_endpoint.get_projects(@user.cookie)
    response_hash = JSON.parse(response)
    response_hash.each do |project|
      id = project['id']
      @endpoints.project_endpoint.change_active_project(id, @user.cookie)
      delete_collections
      delete_environments
      delete_cases
    end
  end

  def delete_collections
    response = @endpoints.collection_endpoint.get_collections(@user.cookie)
    response_hash = JSON.parse(response)
    response_hash.each do |collection|
      response = @endpoints.collection_endpoint.delete_collection(collection['id'], @user.cookie)
      raise response unless response == ''
    end
    response = @endpoints.collection_endpoint.get_collections(@user.cookie)
    response_hash = JSON.parse(response)
    raise "Did not delete these collections: #{response_hash}" unless response_hash == []
  end

  def delete_environments
    response = @endpoints.environment_endpoint.get_environments(@user.cookie)
    response_hash = JSON.parse(response)
    response_hash.each do |env|
      response = @endpoints.environment_endpoint.delete_environment(env['id'], @user.cookie)
      raise response unless response == ''
    end
    response = @endpoints.environment_endpoint.get_environments(@user.cookie)
    response_hash = JSON.parse(response)
    raise "Did not delete these environments: #{response_hash}" unless response_hash == []
  end

  def delete_cases
    response = @endpoints.case_endpoint.get_cases(@user.cookie)
    response_hash = JSON.parse(response)
    response_hash.each do |test_case|
      response = @endpoints.case_endpoint.delete_case(test_case['case_id'], @user.cookie)
      raise response unless response == ''
    end
    response = @endpoints.case_endpoint.get_cases(@user.cookie)
    response_hash = JSON.parse(response)
    raise "Did not delete these cases: #{response_hash}" unless response_hash == []
  end
end
