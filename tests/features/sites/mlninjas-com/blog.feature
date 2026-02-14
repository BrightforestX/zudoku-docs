@site:mlninjas-com @priority:P2
Feature: MLNinjas.com Blog
  As a reader
  I want to access ML insights and articles
  So that I can learn from expert perspectives

  Background:
    Given the user navigates to "https://mlninjas.com/blog"
    And blog posts are published

  Scenario: Browse blog posts
    Given the blog page has loaded
    When the user views the blog
    Then recent posts should be displayed
    And posts should have clear titles and excerpts
    And featured images should be shown

  Scenario: Filter blog posts by topic
    Given multiple blog categories exist
    When the user selects a category
    Then posts should be filtered by that category
    And the selected category should be highlighted
    And the number of posts in each category should be visible

  Scenario: Read full blog post
    Given the user clicks on a blog post
    When the post page loads
    Then the full article should be displayed
    And reading time should be indicated
    And social sharing options should be available
