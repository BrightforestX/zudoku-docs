@shared @seo @performance @priority:P2
Feature: Page Performance for SEO
  As a site owner
  I want fast page load times
  So that search engine rankings are not negatively impacted

  Background:
    Given the site is accessible
    And performance monitoring is enabled

  Scenario: Core Web Vitals - LCP
    Given the user loads a page
    When Largest Contentful Paint is measured
    Then LCP should occur within 2.5 seconds
    And main content should be visible quickly

  Scenario: Core Web Vitals - FID
    Given the user interacts with the page
    When First Input Delay is measured
    Then FID should be less than 100 milliseconds
    And the page should be responsive to user input

  Scenario: Core Web Vitals - CLS
    Given the page is loading
    When Cumulative Layout Shift is measured
    Then CLS should be less than 0.1
    And visual stability should be maintained
