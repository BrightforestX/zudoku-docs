@site:mlninjas-com @priority:P2
Feature: MLNinjas.com Portfolio
  As a potential client
  I want to see past projects
  So that I can evaluate the team's capabilities

  Background:
    Given the user navigates to "https://mlninjas.com/portfolio"
    And portfolio items are published

  Scenario: View portfolio projects
    Given the portfolio page has loaded
    When the user browses projects
    Then projects should be displayed with images
    And brief descriptions should be provided
    And technologies used should be listed

  Scenario: Filter portfolio by industry or technology
    Given multiple projects across industries exist
    When the user applies filters
    Then projects should be filtered accordingly
    And active filters should be clearly indicated
    And filter combinations should work correctly

  Scenario: View detailed project case study
    Given the user clicks on a portfolio item
    When the case study page loads
    Then detailed project information should be shown
    And challenges and solutions should be explained
    And measurable outcomes should be highlighted
