@cross-site @performance @priority:P3
Feature: Shared CDN Resources
  As a developer
  I want shared resources served from a common CDN
  So that assets can be cached across domains

  Background:
    Given multiple domains use common assets
    And a CDN is configured

  Scenario: Serve shared assets from CDN
    Given common assets exist (fonts, icons, libraries)
    When pages from different domains are loaded
    Then shared assets should be served from the same CDN URL
    And assets should be cached after first download
    And subsequent page loads should use cached assets

  Scenario: CDN cache headers
    Given assets are served from the CDN
    When cache headers are inspected
    Then appropriate cache-control headers should be set
    And long cache durations should be used for versioned assets
    And CORS headers should allow cross-domain access

  Scenario: CDN fallback mechanism
    Given the CDN may experience outages
    When the CDN is unavailable
    Then assets should fall back to origin servers
    And the site should remain functional
    And performance degradation should be graceful
