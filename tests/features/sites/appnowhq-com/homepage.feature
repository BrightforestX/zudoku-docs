@site:appnowhq-com @priority:P1
Feature: AppNowHQ.com Homepage
  As a visitor to AppNowHQ.com
  I want to understand the app development platform
  So that I can determine if it meets my needs

  Background:
    Given the user navigates to "https://appnowhq.com"
    And the target audience is entrepreneurs and businesses

  Scenario: Display platform value proposition
    Given the homepage has loaded
    When the user views the content
    Then the rapid app development promise should be clear
    And key platform benefits should be highlighted
    And target users should be identified

  Scenario: Feature highlights carousel
    Given featured capabilities are showcased
    When the user interacts with the carousel
    Then key features should be displayed
    And visuals should illustrate capabilities
    And links to detailed information should be available

  Scenario: Success metrics and social proof
    Given the platform has customer success stories
    When social proof is displayed
    Then key metrics should be shown
    And customer logos should be visible
    And testimonials should build credibility
