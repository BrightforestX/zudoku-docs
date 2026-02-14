@shared @accessibility @priority:P2
Feature: ARIA Compliance
  As a developer
  I want to ensure ARIA attributes are used correctly
  So that assistive technologies work as expected

  Background:
    Given the site uses ARIA attributes
    And WCAG 2.1 guidelines are followed

  Scenario: Valid ARIA roles
    Given the page has elements with ARIA roles
    When ARIA roles are validated
    Then all roles should be valid ARIA 1.2 roles
    And roles should be appropriate for the element type
    And required child/parent relationships should be maintained

  Scenario: ARIA states and properties
    Given interactive components use ARIA
    When component states change
    Then aria-expanded should reflect expansion state
    And aria-checked should reflect checkbox state
    And aria-hidden should be used appropriately

  Scenario: ARIA live regions for dynamic content
    Given the page has dynamic content updates
    When content changes without page reload
    Then aria-live regions should announce changes
    And the politeness level should be appropriate
    And updates should not interrupt user tasks
