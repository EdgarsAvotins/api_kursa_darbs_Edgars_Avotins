Feature: Cases
  Test cases
  consisting of requests

@case
Scenario: Creating test case "Set active project"
  Given I log in with an existing user
  And I setup my default project
  When I create a test case 'Set active project'
  And add requests to this case
  Then this case has been created with requests
