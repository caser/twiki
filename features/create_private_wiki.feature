Feature: Create private wikis
  In order to create private wikis
  A user
  Should be logged in with a premium account

  Background
    Given I am signed in with a premium account

  Scenario: User creates a private wiki
    Given I create a private wiki
    When I go to that wiki's page
    Then I should see the content I created

  Scenario: Unauthenticated user tries to access a private wiki
    Given I create a private wiki
    When an un-authenticated user tries to access the private wiki
    Then he should see "This wiki is private. Please sign in to view."

  Scenario: A user without proper authorization tries to view a private wiki
    Given I create a private wiki
    When a user without proper authorization tries to view a private wiki
    Then he should see "You do not have permission to view this wiki."