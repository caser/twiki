Feature: Add collaborators
  In order to create awesome wikis
  A user
  Should be able to invite unlimited collaborators

  Background:
    Given I am signed in with a premium account
    And I have created a private wiki

  Scenario: A user adds 1000 collaborators to his wiki
    Given I try and add 1000 collaborators to my wiki
    When I press "Invite collaborators"
    Then I should see "Collaboration invite sent to 1000 users."