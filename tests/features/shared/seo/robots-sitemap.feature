@shared @seo @priority:P1
Feature: Robots.txt and Sitemap
  As a site owner
  I want proper robots.txt and sitemap configuration
  So that search engines can crawl my site effectively

  Background:
    Given the site is publicly accessible
    And SEO configuration is in place

  Scenario: Verify robots.txt exists
    Given the site is live
    When a request is made to /robots.txt
    Then the file should be accessible
    And it should contain valid directives

  Scenario: Verify sitemap.xml exists
    Given the site has multiple pages
    When a request is made to /sitemap.xml
    Then the sitemap should be accessible
    And it should contain all public URLs

  Scenario: Sitemap reference in robots.txt
    Given robots.txt is accessible
    When the file content is checked
    Then it should reference the sitemap location
    And the sitemap URL should be valid
