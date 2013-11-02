Feature: Markdown
  In order to validate wiki posts
  A user
  Should be able to see their posts rendered in Markdown in real-time

  Background:
    Given I am signed in

  @javascript
  Scenario: User enters content with Markdown formatting
    When I enter text with Markdown formatting
    Then I should see the text displayed in proper HTML

  @javascript
  Scenario: User enters a code snippet
    When I enter text containing a code snippet
    Then I should see the code snippet displayed in proper HTML