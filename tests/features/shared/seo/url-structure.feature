@shared @seo @priority:P2
Feature: SEO-friendly URL Structure
  As a site owner
  I want clean, descriptive URLs
  So that users and search engines can understand page content

  Background:
    Given the site has multiple pages
    And URL routing is configured

  Scenario: URLs are clean and descriptive
    Given the user navigates through the site
    When URLs are examined
    Then URLs should not contain query parameters for content pages
    And URLs should use hyphens instead of underscores
    And URLs should be lowercase

  Scenario: Canonical URLs prevent duplication
    Given a page can be accessed via multiple URLs
    When the page is loaded
    Then a canonical link tag should be present
    And it should point to the preferred URL

  Scenario: URL trailing slash consistency
    Given the site URL structure is defined
    When different pages are accessed
    Then trailing slash usage should be consistent
    And redirects should be in place for non-canonical versions
