Feature: Markdown
  In order to validate Wiki posts
  A user
  Should be able to see their posts rendered in Markdown in real-time

  Scenario: Real-time post format rendering in Markdown
    Given I am on the post page
    When I fill in "post" with "# This is a title with __bold__ text and *italic* #"
    Then the page should have "<h1>This is a title with <strong>bold</strong> text and <em>italic</em></h1>"