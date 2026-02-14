@shared @errors @priority:P1
Feature: 500 Server Error Page
  As a user encountering a server error
  I want a friendly error page
  So that I understand what happened and what to do next

  Background:
    Given a server error has occurred
    And the 500 error page is configured

  Scenario: Display custom 500 error page
    Given the server encounters an internal error
    When the error page loads
    Then a custom 500 error page should be displayed
    And the message should be user-friendly
    And technical details should be hidden from users

  Scenario: 500 error page guidance
    Given the 500 error page is shown
    When the user reads the content
    Then the page should suggest refreshing
    And contact information should be provided
    And a link back to the homepage should be available

  Scenario: Error tracking and logging
    Given a 500 error occurs
    When the error happens
    Then the error should be logged server-side
    And relevant debugging information should be captured
    And the development team should be notified if critical
