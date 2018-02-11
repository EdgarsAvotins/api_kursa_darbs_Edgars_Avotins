class Afterhook
  def initialize(endpoints)
    @endpoints = endpoints
    @user = Users.default_user
  end

  def delete_created_data
    # TODO: iterate through projects
    delete_collections
    delete_environments
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
end
