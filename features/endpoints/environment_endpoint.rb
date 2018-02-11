class EnvironmentEndpoint
  def initialize(api)
    @api = api
    @header = {"Content-Type" => 'application/json'}
  end

  def get_environments(cookie)
    url = "https://www.apimation.com/environments"
    response = @api.get(url, cookies: cookie)
    return response
  end

  def add_environment(name, cookie)
    payload = {"name":"#{name}"}.to_json
    url = "https://www.apimation.com/environments"
    response = @api.post(url, payload: payload, cookies: cookie)
    return response
  end

  def get_currently_active_environment(cookie)
    url = "https://www.apimation.com/environments/active"
    response = @api.get(url, cookies: cookie)
    return response
  end

  def change_active_environment(environment_id, cookie)
    url = "https://www.apimation.com/environments/active/#{environment_id}"
    response = @api.put(url, payload: "", cookies: cookie)
    return response
  end

  def delete_environment(environment_id, cookie)
    url = "https://www.apimation.com/environments/#{environment_id}"
    response = @api.del(url, cookies: cookie)
    return response
  end
end
