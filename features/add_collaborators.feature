Feature: Add collaborators
  In order to add collaborators
  A user
  Should enter in collaborator emails

  Scenario: Upgrade to a premium account
    Given I am on the add collaborators page
    And I fill in "email" with "elad@email.me"
    When I press "Invite collaborator"
    Then the page should have "Collaboration invitation sent to elad@email.me"