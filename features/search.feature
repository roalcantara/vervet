@javascript
Feature: Search
  As an authenticated user
  I want to be able to search for other users
  In order to find the most interesting vervet users

  Background:
    Given I am authenticated
    And there are existing users registered

  Scenario: User searches for other users
    When I search for users by name
    Then I should see a list of users found by the search

  Scenario: User cleans up the search
    When I clean up the search field
    Then I should see a list of all users
