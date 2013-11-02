Feature: Sign up
  In order to sign up for a free account
  A user
  Should provide a user name, password, and email address

  Scenario: User signs up for a free account
    Given a new user "Casey"
    When he signs up with valid information
    Then he should see "Welcome to Twiki!"

  Scenario: User tries to sign up with a one letter password
    Given a new user "Casey"
    When he signs up with a one letter password
    Then he should see "Please enter a valid password."

  Scenario: User tries to sign up and forgets to put in email
    Given a new user "Casey"
    When he signs up and forgets to put in his email
    Then he should see "Please enter a valid email address."

  Scenario: User picks a username that already exists
    Given a new user "Casey"
    When he signs up with a username that already exists
    Then he should see "Username already in use. Please choose a different name."

  Scenario: User tries to sign up with an email that is already in use
    Given a new user "Casey"
    When he signs up with an email that is already in use
    Then he should see "Email already in use. If you meant to login, please visit the login page."