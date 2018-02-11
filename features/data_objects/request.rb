module Request
  def self.default_request_payload(collection_id)
    payload = {
      "name":"login",
      "description":"request for logging in apimation.. inception or smth",
      "request":{
        "method":"GET",
        "url":"https://www.apimation.com/login",
        "type":"raw",
        "body":"{login:'sx1234@inbox.lv',password:'Parole123'}",
        "binaryContent":
          {"value":"",
           "filename":""},
        "urlEncParams":
          [{"name":"",
            "value":""}],
        "formData":
          [{"type":"text",
            "value":"",
            "name":"",
            "filename":""}],
        "headers":
          [{"name":"Content-Type",
            "value":"application/json"}],
        "greps":[],
        "auth":
          {"type":"noAuth",
            "data":{}}
        },
      "paste":false,
      "collection_id":"#{collection_id}"}.to_json
    payload
  end

  def self.login_payload(collection_id)
    user = Users.default_user
    payload = {
      "name":"Login request",
      "description":"Request for logging in apimation.. inception or smth",
      "request":{
        "method":"GET",
        "url":"https://www.apimation.com/login",
        "type":"raw",
        "body":"{login:'sx1234@inbox.lv',password:'Parole123'}",
        "binaryContent":
          {"value":"",
           "filename":""},
        "urlEncParams":
          [{"name":"",
            "value":""}],
        "formData":
          [{"type":"text",
            "value":"",
            "name":"",
            "filename":""}],
        "headers":
          [{"name":"Content-Type",
            "value":"application/json"}],
        "greps":[],
        "auth":
          {"type":"noAuth",
            "data":{}}
        },
      "paste":false,
      "collection_id":"#{collection_id}"}.to_json
    payload
  end
end
