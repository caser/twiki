Feature: Sign out
  In order to sign out
  A user
  Should click "Sign out"

  Scenario: User logs out of the site
    Given I am signed in
    When I press "Sign out"
    Then I should see the sign in page