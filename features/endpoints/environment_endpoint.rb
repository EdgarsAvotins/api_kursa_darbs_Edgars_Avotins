class EnvironmentEndpoint
  def initialize(api)
    @api = api
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

  def add_global_var(environment_id, key, value, cookie)
    new_var = [{'key': key, 'value': value}]
    global_vars = get_global_vars(environment_id, cookie)
    global_vars.each do |var|
      new_var.push({'key': var['key'], 'value': var['value']})
    end
    global_var_array = new_var
    payload = {'global_vars': global_var_array}.to_json
    url = "https://www.apimation.com/environments/#{environment_id}"
    response = @api.put(url, payload: payload, cookies: cookie)
  end

  def get_global_vars(environment_id, cookie)
    url = "https://www.apimation.com/environments/#{environment_id}"
    response = @api.get(url, cookies: cookie)
    response_hash = JSON.parse(response)
    global_vars = response_hash['global_vars']
    return global_vars
  end
end
