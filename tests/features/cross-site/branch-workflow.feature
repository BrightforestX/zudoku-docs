@cross-site @workflow @branches @priority:P1
Feature: Branch Workflow
  As a documentation site maintainer
  I want a proper branching strategy with dev, test, and main branches
  So that changes are validated before reaching production

  Background:
    Given the zudoku repository is cloned locally
    And the repository has dev, test, and main branches

  Scenario: Dev branch exists and is accessible
    When I check the remote branches
    Then the "dev" branch should exist on origin
    And the dev branch should be based on main

  Scenario: Test branch exists and is accessible
    When I check the remote branches
    Then the "test" branch should exist on origin
    And the test branch should be based on main

  Scenario: Cursor agent branches are created on dev
    Given a brightpath batch operation is launched targeting the dev branch
    When the agents complete their work
    Then new cursor/* branches should be created on origin
    And each cursor branch should be based on the dev branch

  Scenario: Cursor branches merge cleanly into dev
    Given there are unmerged cursor/* branches on origin
    When I run "brightpath merge" from the dev branch
    Then all cursor branches should merge successfully
    And the dev branch should contain all agent changes
    And no merge conflicts should remain

  Scenario: Changes propagate from dev to test
    Given the dev branch has new merged changes
    When I create a pull request from dev to test
    Then the PR should show all changes from merged cursor branches
    And the PR should not have merge conflicts

  Scenario: Changes propagate from test to main
    Given the test branch has validated changes
    When I create a pull request from test to main
    Then the PR should show all validated changes
    And the PR should not have merge conflicts
    And all CI checks should pass

  Scenario: Brightpath merge handles conflicts gracefully
    Given there are cursor branches with overlapping changes
    When I run "brightpath merge"
    Then conflicts should be auto-resolved using theirs strategy
    And a summary should show succeeded and failed counts
    And failed branches should be listed for manual review
