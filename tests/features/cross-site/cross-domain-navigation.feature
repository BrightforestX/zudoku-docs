@cross-site @priority:P2
Feature: Cross-Domain Navigation
  As a user
  I want to navigate between different domain sites
  So that I can access related content across the network

  Background:
    Given multiple domains exist in the network
    And cross-domain links are implemented

  Scenario: Navigate from one domain to another
    Given the user is on domain A
    When the user clicks a link to domain B
    Then the user should be redirected to domain B
    And the target page should load successfully
    And referrer information should be handled appropriately

  Scenario: Maintain consistent branding across domains
    Given the user navigates between domains
    When different domains are viewed
    Then related domains should have consistent branding elements
    And navigation patterns should be familiar
    And user experience should feel cohesive

  Scenario: Cross-domain authentication state
    Given the user is authenticated on domain A
    When the user navigates to domain B
    Then authentication state should be handled appropriately
    And users should not need to re-authenticate unnecessarily
    And security best practices should be followed
