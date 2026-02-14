@shared @responsive @priority:P1
Feature: Viewport Configuration
  As a mobile user
  I want proper viewport configuration
  So that the site displays correctly on my device

  Background:
    Given the user is on a mobile or tablet device
    And viewport meta tag is configured

  Scenario: Viewport meta tag presence
    Given the page HTML is loaded
    When the viewport meta tag is inspected
    Then the viewport meta tag should be present
    And it should include width=device-width
    And it should include initial-scale=1

  Scenario: Prevent text size adjustment
    Given the user is on a mobile device
    When text content is rendered
    Then text should not be artificially resized by the browser
    And text-size-adjust should be set appropriately
    And font sizes should be readable

  Scenario: Responsive images
    Given the page contains images
    When images are loaded on different viewports
    Then images should have appropriate srcset attributes
    And images should serve different sizes based on device
    And images should not overflow their containers
