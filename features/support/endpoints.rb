class Endpoints
  def initialize(api)
    @api = api
  end

  def login_endpoint
    @login_endpoint ||= LoginEndpoint.new(@api)
    @login_endpoint
  end

  def environment_endpoint
    @environment_endpoint ||= EnvironmentEndpoint.new(@api)
    @environment_endpoint
  end

  def collection_endpoint
    @collection_endpoint ||= CollectionEndpoint.new(@api)
    @collection_endpoint
  end
end
