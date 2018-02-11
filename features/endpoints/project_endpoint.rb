class ProjectEndpoint
  def initialize(api)
    @api = api
    @default_project_name = 'test_project'
  end

  def get_projects(cookie)
    url = "https://www.apimation.com/projects"
    response = @api.get(url, cookies: cookie)
    return response
  end

  def change_active_project(project_id, cookie)
    url = "https://www.apimation.com/projects/active/#{project_id}"
    response = @api.put(url, payload: "", cookies: cookie)
    puts response
    return response
  end

  def get_active_project(project_id, cookie)
    url = "https://www.apimation.com/projects/active/#{project_id}"
    response = @api.get(url, cookies: cookie)
    return response
  end
end
