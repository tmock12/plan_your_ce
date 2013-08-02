Feature: Provider edits course from dashboad

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
    And I follow "Inactive Courses"
    When I follow "Edit"
    And I fill in the following:
      | Title          | Construct a fort      |
    And I select "8/22/2015" as the "course Start Date"
    And I select "8/26/2015" as the "course End Date"
    And I press "Update class"
    Then I should be on that courses show page
    And I should see "Construct a fort"
