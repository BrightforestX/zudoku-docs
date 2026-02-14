@shared @responsive @priority:P2
Feature: Tablet Layout
  As a tablet user
  I want an optimized layout for my screen size
  So that I can view content comfortably

  Background:
    Given the user is on a tablet device
    And the viewport width is between 768px and 1024px

  Scenario: Tablet navigation layout
    Given the user loads the site on a tablet
    When the page renders
    Then the navigation should adapt to tablet viewport
    And navigation should use available screen space efficiently
    And touch targets should remain accessible

  Scenario: Content grid for tablets
    Given the page has a grid layout
    When viewed on tablet
    Then content should display in an appropriate number of columns
    And spacing should be optimized for the viewport
    And images should scale appropriately

  Scenario: Portrait and landscape orientation
    Given the user rotates their tablet
    When orientation changes from portrait to landscape
    Then the layout should adapt smoothly
    And content should remain accessible
    And no layout breaks should occur
