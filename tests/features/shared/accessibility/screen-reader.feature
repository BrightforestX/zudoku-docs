@shared @accessibility @priority:P1
Feature: Screen Reader Support
  As a screen reader user
  I want proper semantic markup and ARIA labels
  So that I can understand and navigate the site content

  Background:
    Given the user is using a screen reader
    And the page has loaded

  Scenario: Semantic HTML landmarks
    Given the page structure is defined
    When the screen reader navigates by landmarks
    Then header, nav, main, and footer landmarks should be present
    And each landmark should have appropriate labels

  Scenario: ARIA labels on interactive elements
    Given the page has buttons and links
    When the screen reader announces elements
    Then all interactive elements should have descriptive labels
    And icon-only buttons should have aria-label attributes

  Scenario: Form field labels and instructions
    Given the page contains a form
    When the screen reader focuses on form fields
    Then each field should have an associated label
    And error messages should be announced
    And required fields should be indicated
