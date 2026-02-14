@site:figmatofullstack-ai @priority:P1
Feature: FigmaToFullstack.ai AI Assistant
  As a user
  I want an AI assistant to help with conversions
  So that I can get intelligent suggestions and optimizations

  Background:
    Given the user is logged into "https://figmatofullstack.ai"
    And the AI assistant is available

  Scenario: Get AI recommendations during conversion
    Given the user is converting a design
    When the AI analyzes the design
    Then intelligent recommendations should be provided
    And suggestions should improve code quality
    And alternative approaches should be offered

  Scenario: Natural language component requests
    Given the AI assistant supports natural language
    When the user describes desired changes in plain English
    Then the AI should understand the request
    And appropriate code modifications should be suggested
    And the user can accept or refine suggestions

  Scenario: AI-powered code optimization
    Given the conversion is complete
    When the user requests optimization
    Then the AI should analyze the code
    And optimization opportunities should be identified
    And optimized code should be generated
