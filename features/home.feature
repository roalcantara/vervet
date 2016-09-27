Feature: Home
  As an unauthenticated user
  I want to be able to access the home page
  In order to see all the main features

  Scenario: User sees the page title
    When I go to the home page
    Then I should see the app name on the page title
