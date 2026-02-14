/**
 * Cucumber BDD Configuration
 * 
 * This configuration sets up Cucumber to run BDD tests with:
 * - Feature files location: docs/tests/features/
 * - Step definitions location: docs/tests/step-definitions/
 * - Support for tag filtering (@shared, @cross-site, @site:*)
 * - JSON and HTML report generation
 */

export default {
  // Feature files configuration
  paths: ['tests/features/**/*.feature'],
  
  // Step definitions and support files
  import: ['tests/step-definitions/**/*.{js,mjs,ts}'],
  
  // Format configuration for output
  format: [
    'progress-bar',                                    // Console output with progress
    'json:tests/reports/cucumber-report.json',        // JSON report
    'html:tests/reports/cucumber-report.html',        // HTML report
    'summary'                                          // Summary output
  ],
  
  // Formatter options
  formatOptions: {
    snippetInterface: 'async-await',
    colorsEnabled: true,
  },
  
  // Parallel execution configuration
  parallel: 2,
  
  // Retry configuration for flaky tests
  retry: 1,
  
  // Timeout for steps (in milliseconds)
  timeout: 30000,
  
  // Tag expressions for filtering
  // Examples:
  // - Run shared tests: --tags "@shared"
  // - Run cross-site tests: --tags "@cross-site"
  // - Run site-specific tests: --tags "@site:main"
  // - Combine tags: --tags "@shared and @cross-site"
  // - Exclude tags: --tags "not @site:admin"
  tagExpression: process.env.CUCUMBER_TAGS || '',
  
  // Publish configuration
  publish: false,
  
  // Dry run for validation
  dryRun: false,
  
  // Fail fast on first failure
  failFast: false,
  
  // Strict mode - fail if there are undefined or pending steps
  strict: true,
  
  // World parameters - custom configuration passed to test context
  worldParameters: {
    baseUrl: process.env.BASE_URL || 'http://localhost:3000',
    apiUrl: process.env.API_URL || 'http://localhost:3000/api',
  },
};
