Feature: Provider edits a course

  Background:
    Given I am signed in as an activated provider
    And that provider has the following course:
      | Title          | Build a treehouse                             |
      | Description    | Build a house in a tree and live on an island |
      | Price          | 5.00                                          |
      | Instructor     | Father Robinson                               |
      | Phone          | 770-555-5555                                  |
      | Email          | swissfamily@example.com                       |
      | Credits        | 2                                             |
      | Max Attendance | 30                                            |
    And that course has the address:
      | city    | state |
      | Atlanta | GA    |
    And that course has the dates:
      | start           | end             |
      | 3 days from now | 1 week from now |
    When I am on that courses show page
    And I follow "Edit"
    When I fill in the following:
      | Title          | Construct a fort      |
      | Description    | User sticks and rocks |
      | Price          | 200                   |
      | Instructor     | Roberta               |
      | Phone          | 678-867-5309          |
      | Email          | pirates@example.com   |
      | Credits        | 5                     |
      | Max Attendance | 25                    |
    And I select "8/22/2014" as the "course Start Date"
    And I select "8/26/2014" as the "course End Date"

  Scenario: provider updates course
    Given I press "Update class"
    Then I should see the following:
      | Title          | Construct a fort      |
      | Description    | User sticks and rocks |
      | Price          | 200                   |
      | Instructor     | Roberta               |
      | Phone          | 678-867-5309          |
      | Email          | pirates@example.com   |
      | Credits        | 5                     |
      | Max Attendance | 25                    |

  Scenario: provider cancels update
    Given I follow "Cancel"
    Then I should see the following:
      | Title          | Build a treehouse                             |
      | Description    | Build a house in a tree and live on an island |
      | Price          | 5.00                                          |
      | Instructor     | Father Robinson                               |
      | Phone          | 770-555-5555                                  |
      | Email          | swissfamily@example.com                       |
      | Credits        | 2                                             |
      | Max Attendance | 30                                            |
