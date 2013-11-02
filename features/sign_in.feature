Feature: Sign in
  In order to sign in
  A user
  Should provide a user name and password

  Scenario: User signs in
    Given the user "casey" has an account
    When he logs in with the correct information
    Then he should see "Welcome, casey."

  Scenario: User signs in with the wrong password
    Given the user "casey" has an account
    When he logs in with the wrong password
    Then he should see "Incorrect email or password. Forgot password?"

  Scenario: User signs in with the wrong username
    Given the user "casey" has an account
    When he logs in with the wrong username
    Then he should see "Incorrect email or password. Forgot password?"

  # Move to "Forgot Password" file
  Scenario: User forgot his password
    Given the user "casey" has an account
    When he tries to retrieve his forgotten password
    Then he should see "An e-mail has been sent to your address containing a temporary new password."
