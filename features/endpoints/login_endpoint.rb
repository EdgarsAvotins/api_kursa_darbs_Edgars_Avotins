class LoginEndpoint
  def initialize(api)
    @api = api
  end

  def login(email:, password:)
    payload = {login: email, password: password }.to_json
    url = "https://www.apimation.com/login"
    headers = {"Content-Type" => 'application/json'}
    login_response = @api.post(url, headers: headers, payload: payload)
    return login_response
  end
end
