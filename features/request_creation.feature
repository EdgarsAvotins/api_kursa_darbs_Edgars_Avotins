Feature: Requests
  Creating requests
  for an existing project

Scenario: Creating two requests
  Given I log in with an existing user
  And I add 'PREPROD' environment
  And I add global variables
  And I add login and projects collections
  When I add two requests
  Then two requests have been added
