@site:brightforest-ai @priority:P1
Feature: BrightForest.ai Model Training
  As a data scientist
  I want to train AI models
  So that I can create custom solutions

  Background:
    Given the user is logged into "https://brightforest.ai"
    And model training features are available

  Scenario: Upload training data
    Given the user has training data
    When data is uploaded
    Then various data formats should be supported
    And data validation should occur
    And preview of data should be available

  Scenario: Configure training parameters
    Given training data is ready
    When the user configures training
    Then hyperparameters should be adjustable
    And preset configurations should be available
    And estimated training time should be shown

  Scenario: Monitor training progress
    Given model training has started
    When training is in progress
    Then progress indicators should be visible
    And loss/accuracy metrics should update in real-time
    And training can be stopped if needed

  Scenario: Evaluate trained model
    Given model training is complete
    When the user evaluates the model
    Then evaluation metrics should be displayed
    And model performance should be visualized
    And comparison with baseline should be available
