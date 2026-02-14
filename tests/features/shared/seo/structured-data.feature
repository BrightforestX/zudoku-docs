@shared @seo @priority:P1
Feature: Structured Data (Schema.org)
  As a site owner
  I want structured data markup on my pages
  So that search engines can display rich snippets

  Background:
    Given the user is on a page with content
    And structured data is implemented

  Scenario: Verify JSON-LD presence
    Given the page has loaded
    When the page source is inspected
    Then JSON-LD structured data should be present
    And the structured data should be valid

  Scenario: Organization schema
    Given the site has organization information
    When the homepage is loaded
    Then Organization schema should be present
    And it should include name, logo, and URL

  Scenario: Breadcrumb schema
    Given the user is on a nested page
    When structured data is checked
    Then BreadcrumbList schema should be present
    And it should reflect the page hierarchy
