Feature: Creat public wikis
  In order to create public wikis
  A user
  Should be logged in with a free account

  Scenario: Create a public wiki
    Given I am on the create wiki page
    And I fill in "wiki" with "This is a test wiki."
    When I press "Create wiki"
    Then the page should have "You have successfully created a public wiki."