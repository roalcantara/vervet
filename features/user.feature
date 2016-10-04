@javascript
Feature: User
  As an unauthenticated user
  I want to be able to login
  In order to post about dangers in my surroundings

  Scenario: Incompleted Profile User logs in
    Given I am not authenticated
    When I authenticate with an incompleted profile user
    Then I should be redirected to the account page to complete my profile

  Scenario: User logs out
    Given I am authenticated
    When I log out
    Then I should not be authenticated
