class Endpoints
  def initialize(api)
    @api = api
  end

  def login_endpoint
    @login_endpoint ||= LoginEndpoint.new(@api)
    @login_endpoint
  end
end
