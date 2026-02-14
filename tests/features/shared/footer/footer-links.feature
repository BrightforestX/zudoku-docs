@shared @footer @priority:P2
Feature: Footer Links
  As a user
  I want functional footer links
  So that I can access important pages and information

  Background:
    Given the user is on any page of the site
    And the footer is visible

  Scenario: Essential footer links are present
    Given the footer has loaded
    When the footer content is inspected
    Then links to Privacy Policy should be present
    And links to Terms of Service should be present
    And contact or support links should be present

  Scenario: Footer links are functional
    Given the footer links are visible
    When the user clicks on a footer link
    Then the link should navigate to the correct page
    And the linked page should load successfully
    And external links should open in new tabs

  Scenario: Footer social media links
    Given the site has social media presence
    When social media icons are displayed in the footer
    Then each icon should link to the correct social profile
    And icons should have appropriate aria-labels
    And links should be keyboard accessible
