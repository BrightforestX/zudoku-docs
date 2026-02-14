@shared @accessibility @priority:P1
Feature: Color Contrast Compliance
  As a user with visual impairments
  I want sufficient color contrast
  So that I can read text and distinguish UI elements

  Background:
    Given the user is viewing the site
    And WCAG 2.1 AA standards apply

  Scenario: Text color contrast
    Given the page contains text content
    When color contrast is measured
    Then normal text should have a contrast ratio of at least 4.5:1
    And large text should have a contrast ratio of at least 3:1

  Scenario: Interactive element contrast
    Given the page has buttons and links
    When interactive elements are inspected
    Then button text should meet contrast requirements
    And focus indicators should be clearly visible
    And disabled states should be distinguishable

  Scenario: Non-text content contrast
    Given the page has icons and graphics
    When non-text elements are checked
    Then icons should have sufficient contrast against their background
    And important graphics should meet 3:1 contrast ratio
