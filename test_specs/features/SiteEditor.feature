Feature: Site Editor

  Scenario Outline: ENG-11821 - Site Editor - Verify that a different brand color can be selected and it is applied throughout the site
    Given I login to "<site>" community with "<user>" user
    And I click on 'Administration' main menu tab
    When I click on 'Theme Editor' option on 'Administration' page
    Then I verify the 'Save' button is disabled on 'Theme Editor' page
    When I click on the 'Brand Color' circle
    Then I verify the color picker is displayed
    When I fill in the Hex color field with "<hex_code>" code
    Then I verify Hex color field value is "<hex_code>"
    And I verify the 'Save' button is enabled on 'Theme Editor' page
    When I click on the 'Save' button on 'Theme Editor' page
    And I verify "Saved" popup message is displayed on 'Theme Editor' page
    When I click on 'View Ideas' main menu tab
    And I click on the "<idea_title>" idea on 'View Ideas' page
    Then I verify the idea's rating has "<hex_code>" color
    When I click on 'Home' main menu tab
    Then I verify the navigation bar has "<hex_code>" color
    And I verify the 'Ideas' tab has "<hex_code>" color
    When I click on 'Post Idea' main menu tab
    Then I verify 'Publish' button has "<hex_code>" color
  @non-challenge
  Examples:
    | site                                      | user      | hex_code  | idea_title                    |
    | Non-Challenge community - Admin Settings  | autobot5  | 32c700    | Community Idea AS-011 Votes 1 |