class CollectionEndpoint
  def initialize(api)
    @api = api
  end

  def get_collections(cookie)
    url = "https://www.apimation.com/collections"
    response = @api.get(url, cookies: cookie)
    return response
  end

  def get_collection_requests(collection_id, cookie)
    url = "https://www.apimation.com/collections/#{collection_id}"
    response = @api.get(url, cookies: cookie)
    return response
  end

  def add_collection(name, cookie)
    payload = {"name":"#{name}","description":"Collection: #{name}"}.to_json
    url = "https://www.apimation.com/collections"
    response = @api.post(url, payload: payload, cookies: cookie)
    return response
  end

  def add_request_to_collection(collection_id, cookie, payload: nil)
    payload = Request.default_request_payload(collection_id) if payload.nil?
    url = "https://www.apimation.com/steps"
    response = @api.post(url, payload: payload, cookies: cookie)
    return response
  end

  def delete_collection(collection_id, cookie)
    url = "https://www.apimation.com/collections/#{collection_id}"
    response = @api.del(url, cookies: cookie)
    return response
  end
end
