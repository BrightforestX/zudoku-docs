@shared @theme @priority:P2
Feature: Dark Mode Theme
  As a user who prefers dark mode
  I want to switch to a dark theme
  So that I can reduce eye strain in low-light environments

  Background:
    Given the site supports theme switching
    And dark mode is available

  Scenario: Toggle dark mode
    Given the user is viewing the site in light mode
    When the user clicks the dark mode toggle
    Then the site should switch to dark mode
    And all colors should adapt to the dark theme
    And the preference should be saved

  Scenario: Persist dark mode preference
    Given the user has enabled dark mode
    When the user returns to the site later
    Then dark mode should still be active
    And the preference should be remembered
    And all pages should use the dark theme

  Scenario: Respect system theme preference
    Given the user's operating system is set to dark mode
    When the user visits the site for the first time
    Then the site should default to dark mode
    And the theme should match the system preference
    And users can still manually override the preference
