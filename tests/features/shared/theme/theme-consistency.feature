@shared @theme @priority:P2
Feature: Theme Consistency
  As a user
  I want consistent theming across all pages
  So that the site feels cohesive and professional

  Background:
    Given the site has a defined theme
    And multiple pages exist

  Scenario: Consistent color palette
    Given the user navigates through different pages
    When page colors are observed
    Then primary colors should be consistent
    And accent colors should be used consistently
    And the color palette should match design guidelines

  Scenario: Consistent typography
    Given the site has typography standards
    When text elements are inspected
    Then headings should use consistent fonts and sizes
    And body text should be uniform across pages
    And font weights should be applied consistently

  Scenario: Theme applies to all components
    Given the user switches themes
    When all UI components are checked
    Then buttons should reflect the theme
    And form inputs should match the theme
    And navigation elements should adapt to the theme
