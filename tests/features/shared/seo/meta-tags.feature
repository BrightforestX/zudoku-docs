@shared @seo @priority:P1
Feature: SEO Meta Tags
  As a site owner
  I want proper meta tags on all pages
  So that search engines can index my content correctly

  Background:
    Given the user is on any page of the site
    And meta tags are configured

  Scenario: Verify essential meta tags
    Given the page has loaded
    When the page HTML is inspected
    Then the page should have a title tag
    And the page should have a meta description
    And the page should have a canonical URL

  Scenario: Open Graph meta tags
    Given the page is configured for social sharing
    When the page metadata is checked
    Then og:title should be present
    And og:description should be present
    And og:image should be present

  Scenario: Twitter Card meta tags
    Given the page supports Twitter sharing
    When the Twitter meta tags are inspected
    Then twitter:card should be defined
    And twitter:title should be present
    And twitter:description should be present
