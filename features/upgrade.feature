Feature: Upgrade to premium
  In order to upgrade to a premium account
  A user
  Should provide his/her billing information

  Background:
    Given I am signed in with a free account

  Scenario: User upgrades to a premium account
    Given I enter in my billing information
    When I try to upgrade my account
    Then I should see "Congratulations! You are now a premium user."

  Scenario: User enters a credit card number that is too short
    Given I enter in a credit card number that is too short
    When I try to upgrade my account
    Then I should see "Please enter a valid credit card number."

  Scenario: User forgets to provide a zip code
    Given I enter in my information without a zip code
    When I try to upgrade my account
    Then I should see "Please enter a valid zip code."

  Scenario: User forgets to provide a city
    Given I enter in my information without a city
    When I try to upgrade my account
    Then I should see "Please enter a valid city."

  Scenario: User forgets to provide a state
    Given I enter in my information without a state
    When I try to upgrade my account
    Then I should see "Please enter a valid state."

  Scenario: User forgets to provide a country
    Given I enter in my information without a country
    When I try to upgrade my account
    Then I should see "Please enter a valid country."