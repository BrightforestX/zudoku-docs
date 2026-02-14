@shared @performance @priority:P2
Feature: Resource Loading Strategy
  As a developer
  I want optimized resource loading
  So that critical content renders quickly

  Background:
    Given the page has multiple resources
    And loading optimization is implemented

  Scenario: Critical CSS inlining
    Given the page has CSS dependencies
    When the initial HTML is loaded
    Then critical CSS should be inlined in the head
    And non-critical CSS should be loaded asynchronously
    And render-blocking should be minimized

  Scenario: JavaScript loading strategy
    Given the page requires JavaScript
    When scripts are loaded
    Then scripts should use defer or async attributes
    And critical scripts should be loaded first
    And third-party scripts should not block rendering

  Scenario: Resource hints and preloading
    Given the page needs specific resources early
    When the HTML is parsed
    Then dns-prefetch should be used for external domains
    And preconnect should be used for critical origins
    And preload should be used for critical resources
