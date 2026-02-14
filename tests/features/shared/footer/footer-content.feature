@shared @footer @priority:P2
Feature: Footer Content and Layout
  As a site visitor
  I want a well-organized footer
  So that I can find additional information and resources

  Background:
    Given the user scrolls to the footer
    And the footer is fully rendered

  Scenario: Footer content organization
    Given the footer contains multiple sections
    When the footer is viewed
    Then content should be organized into logical groups
    And section headings should be clear
    And the layout should be visually balanced

  Scenario: Copyright and legal information
    Given the footer includes legal information
    When the footer is inspected
    Then copyright notice should be present and current
    And company information should be displayed
    And legal disclaimers should be visible if applicable

  Scenario: Footer responsive layout
    Given the user is on different devices
    When the footer is viewed on mobile, tablet, and desktop
    Then the footer should adapt to each viewport
    And content should remain readable and accessible
    And link columns should stack appropriately on mobile
