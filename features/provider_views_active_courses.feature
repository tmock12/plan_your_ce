Feature: Provider views active courses

  Scenario:
    Given I am signed in as an activated provider
    And that provider has the following course:
      | title      | Build a treehouse |
    And that course has the address:
      | city    | state |
      | Atlanta | GA    |
    And that course has the dates:
      | start           | end             |
      | 3 days from now | 1 week from now |
    When I am on the providers dashboard page
    And I follow "Active Courses"
    Then I should see the following:
      | Build a treehouse |
      | Atlanta, GA       |
    And I should see that courses formatted dates
