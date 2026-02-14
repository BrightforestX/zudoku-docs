@shared @responsive @priority:P1
Feature: Touch Interactions
  As a touchscreen user
  I want touch-optimized interactions
  So that I can navigate and interact comfortably

  Background:
    Given the user is on a touchscreen device
    And touch events are supported

  Scenario: Minimum touch target size
    Given the page has interactive elements
    When touch targets are measured
    Then all interactive elements should be at least 44x44 pixels
    And spacing between targets should prevent accidental taps
    And touch feedback should be provided

  Scenario: Swipe gestures
    Given the page supports swipe interactions
    When the user swipes on touch-enabled components
    Then swipe gestures should work smoothly
    And swipe direction should be intuitive
    And accidental swipes should be prevented

  Scenario: Touch-friendly forms
    Given the page contains form elements
    When the user interacts with form controls on touch devices
    Then dropdowns should be easy to tap
    And checkboxes and radio buttons should be large enough
    And input focus should not cause page zoom
