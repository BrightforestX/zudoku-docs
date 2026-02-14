@shared @performance @priority:P1
Feature: Page Load Time
  As a user
  I want pages to load quickly
  So that I can access content without delays

  Background:
    Given the user is accessing the site
    And performance metrics are being measured

  Scenario: Initial page load performance
    Given the user navigates to the homepage
    When the page loads
    Then the page should load within 3 seconds
    And Time to First Byte should be under 600ms
    And the page should be interactive quickly

  Scenario: Subsequent page navigation
    Given the user is already on the site
    When the user navigates to another page
    Then navigation should feel instant
    And shared resources should be cached
    And page transitions should be smooth

  Scenario: Slow network conditions
    Given the user is on a slow 3G connection
    When the page loads
    Then critical content should load within 5 seconds
    And the page should show loading indicators
    And the user should be able to start reading content
