@shared @accessibility @priority:P1
Feature: Image Alternative Text
  As a screen reader user
  I want descriptive alternative text for images
  So that I can understand visual content

  Background:
    Given the page contains images
    And accessibility standards are implemented

  Scenario: Alt text for informative images
    Given the page has informative images
    When images are inspected
    Then each informative image should have meaningful alt text
    And the alt text should describe the image content

  Scenario: Empty alt for decorative images
    Given the page has decorative images
    When decorative images are checked
    Then they should have empty alt attributes (alt="")
    And screen readers should skip them

  Scenario: Complex images with longer descriptions
    Given the page has complex diagrams or charts
    When complex images are evaluated
    Then they should have both alt text and extended descriptions
    And aria-describedby should link to detailed descriptions
