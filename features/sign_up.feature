Feature: Sign up
  In order to sign up for a free account
  A user
  Should provide a user name, password, and email address

  Scenario: Signs up for a free account
    Given I am on the sign up page
    And I fill in "username" with "casey"
    And I fill in "password" with "secret"
    And I fill in "email" with "casey@email.me"
    When I press "Sign up"
    Then the page should have a message saying "Your account has been successfully created."