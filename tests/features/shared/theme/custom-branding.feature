@shared @theme @priority:P3
Feature: Custom Branding
  As a site administrator
  I want to apply custom branding
  So that the site reflects our brand identity

  Background:
    Given the site supports custom branding
    And branding configuration is available

  Scenario: Custom logo display
    Given a custom logo is configured
    When the site loads
    Then the custom logo should appear in the header
    And the logo should link to the homepage
    And the logo should scale appropriately on different devices

  Scenario: Custom color scheme
    Given custom brand colors are configured
    When the theme is applied
    Then primary brand colors should be used throughout
    And the color scheme should override default colors
    And colors should maintain accessibility standards

  Scenario: Custom fonts
    Given custom fonts are specified
    When pages render
    Then the custom fonts should load successfully
    And text should display in the custom typeface
    And fallback fonts should be available
