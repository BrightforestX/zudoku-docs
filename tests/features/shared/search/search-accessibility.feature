@shared @search @accessibility @priority:P1
Feature: Search Accessibility
  As a user with disabilities
  I want accessible search functionality
  So that I can search the site using assistive technology

  Background:
    Given the site has search functionality
    And accessibility features are implemented

  Scenario: Search form accessibility
    Given the search form is on the page
    When a screen reader user navigates to it
    Then the search input should have a proper label
    And the search button should be clearly identified
    And the form should have appropriate ARIA roles

  Scenario: Keyboard-only search interaction
    Given the user is using only the keyboard
    When the user navigates to the search box
    Then the search input should be reachable via Tab
    And autocomplete should be keyboard navigable
    And search results should be keyboard accessible

  Scenario: Screen reader result announcements
    Given the user has performed a search
    When results are loaded
    Then the number of results should be announced
    And result updates should use ARIA live regions
    And filter changes should be announced to screen readers
