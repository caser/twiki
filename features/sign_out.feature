Feature: Sign out
  In order to sign out
  A user
  Should click "Sign out"

  Scenario: Signs up for a free account
    Given I am on a page
    When I press "Sign out"
    Then the page should have a message saying "You have successfully logged out."