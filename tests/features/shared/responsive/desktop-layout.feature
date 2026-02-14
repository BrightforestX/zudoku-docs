@shared @responsive @priority:P1
Feature: Desktop Layout
  As a desktop user
  I want a full-featured layout
  So that I can take advantage of my larger screen

  Background:
    Given the user is on a desktop device
    And the viewport width is 1280px or greater

  Scenario: Full desktop navigation
    Given the user loads the site on desktop
    When the page renders
    Then the full navigation menu should be visible
    And all navigation items should be displayed horizontally
    And dropdown menus should appear on hover

  Scenario: Multi-column content layout
    Given the page has content that benefits from columns
    When viewed on desktop
    Then content should use available width effectively
    And sidebars should be visible where appropriate
    And reading line length should remain comfortable

  Scenario: Desktop-specific features
    Given the site has desktop-enhanced features
    When the user interacts with the site
    Then hover states should be visible
    And tooltips should appear on hover
    And keyboard shortcuts should be available
