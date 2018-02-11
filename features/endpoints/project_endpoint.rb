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
end
