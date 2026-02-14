@shared @responsive @priority:P1
Feature: Mobile Layout
  As a mobile user
  I want a properly adapted layout
  So that I can use the site comfortably on my device

  Background:
    Given the user is on a mobile device
    And the viewport width is 375px or less

  Scenario: Mobile-optimized navigation
    Given the user loads the site on mobile
    When the page renders
    Then the navigation should be collapsed into a hamburger menu
    And the menu should be accessible via touch
    And menu items should be finger-friendly (minimum 44px touch target)

  Scenario: Content reflow for mobile
    Given the page has multi-column content
    When viewed on mobile
    Then content should stack vertically
    And text should be readable without zooming
    And horizontal scrolling should not be required

  Scenario: Mobile form inputs
    Given the page contains form fields
    When the user interacts with forms on mobile
    Then input fields should be large enough for touch
    And the keyboard should show appropriate input types
    And form labels should be clearly visible
