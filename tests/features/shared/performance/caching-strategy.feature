@shared @performance @priority:P1
Feature: Caching Strategy
  As a site owner
  I want effective caching
  So that returning users experience faster load times

  Background:
    Given the site implements caching strategies
    And the user has visited the site before

  Scenario: Browser caching for static assets
    Given static assets are served
    When cache headers are inspected
    Then static assets should have long cache durations
    And cache-control headers should be appropriate
    And versioned assets should be immutable

  Scenario: Service worker caching
    Given a service worker is registered
    When the user revisits the site
    Then critical assets should be served from cache
    And the page should load even when offline
    And stale-while-revalidate should be used appropriately

  Scenario: CDN caching
    Given assets are served via CDN
    When assets are requested from different locations
    Then assets should be cached at edge locations
    And cache hit rates should be high
    And cache invalidation should work correctly
