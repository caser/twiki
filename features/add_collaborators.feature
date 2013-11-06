Feature: Add collaborators
  In order to add collaborators
  A user
  Should enter in collaborator emails

  Background:
    Given I am signed in with a premium account
    And I have created a private wiki

  Scenario: User adds a collaborator to a wiki
    Given I try and add a collaborator to my wiki
    When I press "Invite collaborators"
    Then I should see "Collaboration invite sent to 1 user."

  Scenario: User enters an invalid email when adding a collaborator
    Given I try and add a collaborator to my wiki
    And I enter an invalid email
    When I press "Invite collaborators"
    Then I should see "Please enter a valid email."