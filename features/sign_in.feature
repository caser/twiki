Feature: Sign in
  In order to sign in
  A user
  Should provide a user name and password

  Scenario: Signs up for a free account
    Given I am on the sign in page
    And I fill in "username" with "casey"
    And I fill in "password" with "secret"
    When I press "Sign in"
    Then the page should have a message saying "Welcome, casey."