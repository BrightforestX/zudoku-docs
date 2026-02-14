@shared @navigation @priority:P3
Feature: Back to Top Button
  As a user
  I want a back to top button
  So that I can quickly return to the top of long pages

  Background:
    Given the user is on a page with long scrollable content
    And the back to top button is implemented

  Scenario: Show back to top button on scroll
    Given the user is at the top of the page
    When the user scrolls down past a certain threshold
    Then the back to top button should appear
    And the button should be fixed in position

  Scenario: Return to top on click
    Given the back to top button is visible
    When the user clicks the button
    Then the page should smoothly scroll to the top
    And focus should return to the top of the page

  Scenario: Hide button when at top
    Given the back to top button is visible
    When the user scrolls to the top of the page
    Then the back to top button should disappear
    And it should not interfere with other content
