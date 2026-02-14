@shared @navigation @priority:P1
Feature: Navigation Menu
  As a user
  I want to navigate through the site using the main menu
  So that I can access different sections easily

  Background:
    Given the user is on the site
    And the navigation menu is visible

  Scenario: Display navigation menu items
    Given the page has loaded completely
    When the user views the navigation menu
    Then all menu items should be displayed
    And menu items should be clickable

  Scenario: Navigate using menu items
    Given the user is on the homepage
    When the user clicks on a menu item
    Then the user should be redirected to the correct page
    And the active menu item should be highlighted

  Scenario: Mobile navigation menu
    Given the user is on a mobile device
    When the user taps the menu toggle button
    Then the mobile menu should expand
    And all navigation items should be accessible
