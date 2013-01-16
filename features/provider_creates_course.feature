Feature: Provider creates a course

  Scenario:
    Given I am signed in
    And I am on the courses page
    When I follow "Add new class"
    And I fill in the following:
      | Title          | Build a treehouse                             |
      | Description    | Build a house in a tree and live on an island |
      | Price          | 5.00                                          |
      | Instructor     | Father Robinson                               |
      | Address        | 411 Crescent Avenue                           |
      | City           | Avalon                                        |
      | Zip Code       | 90704                                         |
      | Phone          | 770-555-5555                                  |
      | Email          | swissfamily@example.com                       |
      | Credits        | 2                                             |
      | Max Attendance | 30                                            |
    And I select "California" from "State"
    And I select "Endodontics" from "Category"
    And I check "Dental Assistant"
    And I check "Dentist"
    And I select "5/20/2014" as the "course Start Date"
    And I select "5/22/2014" as the "course End Date"
    When I press "Add class"
    Then I should see "Build a treehouse"

    And I should see the following:
      | Build a treehouse                             |
      | Build a house in a tree and live on an island |
      | $5.00                                         |
      | Father Robinson                               |
      | 411 Crescent Avenue                           |
      | Avalon                                        |
      | CA                                            |
      | 90704                                         |
      | 770-555-5555                                  |
      | swissfamily@example.com                       |
      | 2                                             |
      | 30                                            |
      | Endodontics                                   |
      | Dentist, Dental Assistant                     |
      | May 20, 2014                                  |
      | May 22, 2014                                  |
