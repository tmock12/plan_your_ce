Feature: Provider views dashboard
  Background:
    Given I am signed in as an activated provider

  Scenario: with courses
    Given I have a course
    And I am on the dashboard page
    Then I should see "Learn to swim"

  Scenario: with no courses
    Given I am on the dashboard page
    Then I should see "You haven't created a course, create one now..."
