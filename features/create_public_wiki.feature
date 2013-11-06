Feature: Create public wikis
  In order to create public wikis
  A user
  Should be logged in with a free account

  Background
    Given I am signed in

  Scenario: User creates a public wiki
    Given I create a public wiki
    When I go to that wiki's page
    Then I should see the content I created

  Scenario: User tries to create a wiki with 10 characters
    Given I enter 10 characters into a wiki
    When I try to create the wiki
    Then I should see "Please enter at least 20 characters."

  Scenario: User forgets to enter a title for their wiki
    Given I try to create a wiki without a title
    When I try to create the wiki
    Then I should see "Please enter a title for your wiki."