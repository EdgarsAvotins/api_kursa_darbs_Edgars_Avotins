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
        "method":"POST",
        "url":"https://www.apimation.com/login",
        "type":"raw",
        "body":"{\"login\": \"$user\", \"password\": \"$password\"}",
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

  def self.change_active_project_payload(collection_id, project_id, cookie)
    user = Users.default_user
    cookie = cookie['dancer.session']
    p cookie
    payload = {
      "name":"Change project request",
      "description":"Request for changing project",
      "request":{
        "method":"PUT",
        "url":"https://www.apimation.com/projects/active/#{project_id}",
        "type":"raw",
        "body":"",
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
            "value":"application/json"},
          {"name":"Cookie",
            "value":"dancer.session=#{cookie}"}],
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
