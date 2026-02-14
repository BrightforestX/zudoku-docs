@shared @navigation @priority:P2
Feature: Breadcrumb Navigation
  As a user
  I want to see breadcrumb navigation
  So that I can understand my current location and navigate back easily

  Background:
    Given the user is on a nested page
    And breadcrumbs are enabled on the site

  Scenario: Display breadcrumb trail
    Given the user is on a sub-page
    When the page loads
    Then the breadcrumb trail should be visible
    And the breadcrumb should show the correct hierarchy

  Scenario: Navigate using breadcrumbs
    Given the user sees the breadcrumb trail
    When the user clicks on a breadcrumb link
    Then the user should be redirected to that page
    And the page should load successfully

  Scenario: Breadcrumb accessibility
    Given the user is using a screen reader
    When the user navigates to the breadcrumbs
    Then the breadcrumb navigation should have proper ARIA labels
    And the structure should be semantically correct
