module Case
  def self.create_payload(name: 'DefaultName', description: "Default description")
    payload = {
      "name":"#{name}",
      "description":"#{description}",
      "request":{
        "requests":[],
        "vars":[{
          "name":"",
          "value":""}],
        "assertWarn":1}
      }
    payload
  end

  def self.united_request_payload(project_id, case_id, cookie, name: 'DefaultName', description: "Default description")
    cookie = cookie['dancer.session']
    payload = {
      "case_name":"#{name}",
      "case_id":"#{case_id}",
      "request":{
        "requests":[{
          "asserts":[],
          "headers":[{
            "name":"Content-Type",
            "value":"application/json"
            }],
          "greps":[{
            "type":"json",
            "expression":"",
            "varname":""
            }],
          "formData":[{
            "type":"text",
            "value":"",
            "name":"",
            "filename":""
            }],
          "binaryContent":{
            "value":"",
            "filename":""
            },
          "body":"{\"login\": \"$user\", \"password\": \"$password\"}",
          "url":"https://www.apimation.com/login",
          "type":"raw",
          "urlEncParams":[{
            "name":"","value":""
            }],
          "method":"GET",
          "step_name":"login",
          "loopData":{
            "loop":true,
            "count":1,
            "interval":1,
            "conditions":[]
            }},
          {"step_name":"Change project request",
            "url":"https://www.apimation.com/projects/active/#{project_id}",
            "body":"","formData":[{
              "type":"raw",
              "value":"",
              "name":"",
              "filename":""
              }],
            "urlEncParams":[{
              "name":"",
              "value":""
              }],
            "binaryContent":{
              "value":"",
              "filename":""
              },
            "type":"raw",
            "headers":[{
              "name":"Content-Type",
              "value":"application/json"
              },
              {
              "name":"Cookie",
              "value":"dancer.session=#{cookie}"
              }],
            "method":"PUT",
            "greps":[{
              "type":"json",
              "expression":"",
              "varname":""
              }],
            "asserts":[]
            }],
          "vars":[{
            "name":"",
            "value":""
            }],
          "assertWarn":1
          },
        "name":"#{name}",
        "id":"#{case_id}",
        "description":"#{description}"
      }
    payload
  end

  def self.add_login_request_payload(case_id, name: 'DefaultName', description: "Default description")
    user = Users.default_user
    payload = {
      "case_name":"#{name}",
      "case_id":"#{case_id}",
      "request":{
        "requests":[{
          "step_name":"Login request",
          "url":"https://www.apimation.com/login",
          "body":"{\"login\": \"$user\", \"password\": \"$password\"}",
          "formData":[{
            "type":"text",
            "value":"",
            "name":"",
            "filename":""}],
          "urlEncParams":[{
            "name":"zxc",
            "value":"asd"}],
          "binaryContent":{
            "value":"",
            "filename":""},
          "type":"raw",
          "headers":[{
            "name":"Content-Type",
            "value":"application/json"}],
          "method":"POST",
          "greps":[{
            "type":"json",
            "expression":"",
            "varname":""}],
          "asserts":[]}],
        "vars":[{
          "name":"",
          "value":""}],
        "assertWarn":1},
        "name":"#{name}",
        "id":"#{case_id}",
        "description":"#{description}"}
    payload
  end

  def self.add_change_project_request_payload(case_id, project_id, cookie, name: 'DefaultName', description: "Default description")
    cookie = cookie['dancer.session']
    payload = {
      "case_name":"#{name}",
      "case_id":"#{case_id}",
      "request":{
        "requests":[{
          "step_name":"Change project request",
          "url":"https://www.apimation.com/projects/active/#{project_id}",
          "body":"",
          "formData":[{
            "type":"text",
            "value":"",
            "name":"",
            "filename":""}],
          "urlEncParams":[{
            "name":"zxc",
            "value":"asd"}],
          "binaryContent":{
            "value":"",
            "filename":""},
          "type":"raw",
          "headers":
            [{"name":"Content-Type",
              "value":"application/json"},
            {"name":"Cookie",
              "value":"dancer.session=#{cookie}"}],
          "method":"POST",
          "greps":[{
            "type":"json",
            "expression":"",
            "varname":""}],
          "asserts":[]}],
        "vars":[{
          "name":"",
          "value":""}],
        "assertWarn":1},
        "name":"#{name}",
        "id":"#{case_id}",
        "description":"#{description}"}
    payload
  end
end
