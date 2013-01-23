Feature: Provider views dashboard
  Background:
    Given I am signed in as an activated provider

  Scenario: with courses
    Given I have a course
    And I am on the providers dashboard page
    Then I should see "You have 1 active course"

  Scenario: with no courses
    Given I am on the providers dashboard page
    Then I should see "You haven't created a course, create one now..."
