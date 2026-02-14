@shared @navigation @accessibility @priority:P1
Feature: Skip to Content Links
  As a keyboard user
  I want to use skip links
  So that I can bypass repetitive navigation and jump to main content

  Background:
    Given the user is using keyboard navigation
    And skip links are implemented on the page

  Scenario: Display skip link on focus
    Given the user loads the page
    When the user presses the Tab key
    Then the skip link should become visible
    And the skip link should be the first focusable element

  Scenario: Skip to main content
    Given the skip link is visible
    When the user activates the skip link
    Then focus should move to the main content area
    And the navigation should be bypassed

  Scenario: Multiple skip links
    Given the page has multiple skip links
    When the user tabs through skip links
    Then each skip link should be accessible
    And each link should jump to the correct target
