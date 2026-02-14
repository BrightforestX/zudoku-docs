@shared @components @mdx @priority:P1
Feature: Shared MDX Components
  As a documentation site visitor
  I want consistent, interactive UI components across all pages
  So that I have a professional and cohesive reading experience

  Background:
    Given the documentation site is running
    And shared MDX components are registered in zudoku config

  Scenario: DomainHero component renders correctly
    When I visit a page that uses the DomainHero component
    Then the hero section should display the domain title
    And the hero section should display the domain description
    And the hero section should show the hero image if provided
    And the hero should have a gradient background

  Scenario: FeatureCard component displays status badges
    When I visit a page that uses FeatureCard components
    Then each card should show a title and description
    And cards with "coming-soon" status should show a yellow "Coming Soon" badge
    And cards with "beta" status should show a blue "Beta" badge
    And cards with "available" status should not show a badge

  Scenario: DomainGrid shows all 13 domains
    When I visit a page that uses the DomainGrid component
    Then the grid should display exactly 13 domain cards
    And each card should show the domain name and tagline
    And each card should be clickable

  Scenario: CliCommand component has copy functionality
    When I visit a page that uses the CliCommand component
    Then the command should be displayed in a styled code block
    And a copy button should be visible
    And the optional description should be displayed above the command

  Scenario: StepByStep component renders numbered steps
    When I visit a page that uses the StepByStep component
    Then each step should be numbered sequentially
    And each step should show title and description
    And steps should be connected with a vertical line

  Scenario: AgentCapability component shows MCP agent info
    When I visit a page that uses the AgentCapability component
    Then the card should display the agent name
    And the card should list agent capabilities
    And the card should show connection status

  Scenario: ComparisonTable component renders correctly
    When I visit a page that uses the ComparisonTable component
    Then the table should have the correct headers
    And the table should display all rows of data
    And the table should be responsive on mobile

  Scenario: All shared components are responsive
    When I view any page with shared components on a mobile viewport
    Then all components should adapt to the smaller screen
    And no content should overflow horizontally
    And text should remain readable
