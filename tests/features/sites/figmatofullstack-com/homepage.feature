@site:figmatofullstack-com @priority:P1
Feature: FigmaToFullstack.com Homepage
  As a designer or developer
  I want to understand the Figma to fullstack conversion service
  So that I can determine if it meets my project needs

  Background:
    Given the user navigates to "https://figmatofullstack.com"
    And the target audience is designers and developers

  Scenario: Display service value proposition
    Given the homepage has loaded
    When the user views the main content
    Then the service offering should be clearly explained
    And the conversion process should be outlined
    And benefits over manual coding should be highlighted

  Scenario: Showcase conversion examples
    Given example conversions are featured
    When the user views examples
    Then before/after comparisons should be shown
    And code quality should be demonstrated
    And various component types should be represented

  Scenario: Pricing and plans overview
    Given pricing information is on the homepage
    When the user looks for pricing details
    Then pricing tiers should be summarized
    And key plan differences should be visible
    And links to full pricing page should be available
