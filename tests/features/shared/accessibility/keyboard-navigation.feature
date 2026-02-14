@shared @accessibility @priority:P1
Feature: Keyboard Navigation
  As a keyboard-only user
  I want to navigate the entire site using only my keyboard
  So that I can access all functionality without a mouse

  Background:
    Given the user is using keyboard navigation
    And the site is fully loaded

  Scenario: Tab through all interactive elements
    Given the user is on any page
    When the user presses Tab repeatedly
    Then all interactive elements should receive focus
    And focus should follow a logical order
    And focus indicators should be clearly visible

  Scenario: Access dropdown menus with keyboard
    Given the site has dropdown menus
    When the user navigates to a menu using Tab
    Then the menu should be accessible via Enter or Space
    And submenu items should be navigable with arrow keys

  Scenario: Escape key closes modals and menus
    Given a modal or menu is open
    When the user presses the Escape key
    Then the modal or menu should close
    And focus should return to the triggering element
