Feature: Upgrade to premium
  In order to upgrade to a premium account
  A user
  Should provide his/her billing information

  Scenario: Upgrade to a premium account
    Given I am on the upgrade page
    And I fill in "cc-number" with "0000123400001234"
    And I fill in "address" with "123 River Rd"
    And I fill in "city" with "Anytown"
    And I fill in "state" with "Oregon"
    And I fill in "country" with "USA"
    And I fill in "zip" with "19832"
    When I press "Upgrade account"
    Then the page should have "Congratulations! You are now a premium user."