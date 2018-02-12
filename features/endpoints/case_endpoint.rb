class CaseEndpoint
  def initialize(api)
    @api = api
  end

  def get_cases(cookie)
    url = "https://www.apimation.com/cases"
    response = @api.get(url, cookies: cookie)
    return response
  end

  def add_case(cookie, payload: nil)
    payload = Case.create_payload if payload.nil?
    payload = payload.to_json
    url = "https://www.apimation.com/cases"
    response = @api.post(url, payload: payload, cookies: cookie)
    return response
  end

  def add_request_to_case(case_id, cookie, payload: nil)
    payload = Case.add_login_request_payload(case_id) if payload.nil?
    payload = payload.to_json
    url = "https://www.apimation.com/cases/#{case_id}"
    response = @api.put(url, payload: payload, cookies: cookie)
    return response
  end

  def delete_case(case_id, cookie)
    url = "https://www.apimation.com/cases/#{case_id}"
    response = @api.del(url, cookies: cookie)
    return response
  end
end
