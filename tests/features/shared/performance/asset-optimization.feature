@shared @performance @priority:P1
Feature: Asset Optimization
  As a site owner
  I want optimized assets
  So that pages load faster and use less bandwidth

  Background:
    Given the site serves various assets
    And optimization is enabled

  Scenario: Image optimization
    Given the page contains images
    When images are loaded
    Then images should be served in modern formats (WebP, AVIF)
    And images should be appropriately sized for the viewport
    And lazy loading should be implemented for below-fold images

  Scenario: CSS and JavaScript minification
    Given the site has CSS and JavaScript files
    When assets are inspected
    Then CSS files should be minified
    And JavaScript files should be minified
    And source maps should not be served in production

  Scenario: Asset compression
    Given the server is responding to asset requests
    When text-based assets are requested
    Then Gzip or Brotli compression should be enabled
    And compression ratio should be significant
    And appropriate content-encoding headers should be set
