@shared @accessibility @priority:P1
Feature: Focus Management
  As a keyboard user
  I want predictable focus behavior
  So that I always know where I am on the page

  Background:
    Given the user is navigating with keyboard
    And interactive elements are present

  Scenario: Visible focus indicators
    Given the user tabs through the page
    When an element receives focus
    Then a visible focus indicator should appear
    And the indicator should meet contrast requirements
    And custom focus styles should not be removed

  Scenario: Focus trap in modals
    Given a modal dialog is open
    When the user tabs through elements
    Then focus should remain trapped within the modal
    And focus should cycle between modal elements
    And closing the modal should return focus appropriately

  Scenario: Skip repetitive focus navigation
    Given the page has repetitive navigation
    When the user tabs from the top
    Then skip links should allow bypassing navigation
    And focus should move to main content when activated
