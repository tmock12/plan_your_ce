Feature: Provider views inactive courses

  Scenario:
    Given I am signed in as an activated provider
    And that provider has the following course:
      | title      | Build a fort |
    And that course has the address:
      | city         | state |
      | Jacksonville | FL    |
    And that course has the dates:
      | start      | end        |
      | 1 week ago | 4 days ago |
    When I am on the providers dashboard page
    Then I should see "and 1 inactive course"
    And I follow "Inactive Courses"
    Then I should see the following:
      | Build a fort     |
      | Jacksonville, FL |
    And I should see that courses formatted dates
