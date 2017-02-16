Feature: Theme Editor

  @Test
  Scenario Outline: ENG-11827 - Verify that the navigation bar adjusts to the logo's height (Logo's Height 30px)
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Theme Editor' option on 'Administration' page
    And I click on 'Change' link on 'Logo' section
    And I select the "<logo_path>" image
    When I click on the 'Save' button on 'Theme Editor' page
    Then I verify that the navigation bar moves up to adjust to the height
    And I verify that the Navigation bar is centered aligned
  Examples:
    | site                                   | user     | logo_path     |
    | Non-Challenge community - Theme Editor | autobot5 | logo_30px.jpg |
    | Challenge community - Theme Editor     | autobot5 | logo_30px.jpg |

  @Test
  Scenario Outline: ENG-11827 - Verify that the navigation bar adjusts to the logo's height (Logo's Height 60px)
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Theme Editor' option on 'Administration' page
    And I click on 'Change' link on 'Logo' section
    And I select the "<logo_path>" image
    When I click on the 'Save' button on 'Theme Editor' page
    Then I verify that the navigation bar moves up to adjust to the height
    And I verify that the Navigation bar is centered aligned

  Examples:
    | site                                   | user     | logo_path     |
    | Non-Challenge community - Theme Editor | autobot5 | logo_60px.jpg |
    | Challenge community - Theme Editor     | autobot5 | logo_60px.jpg |

  @Test
  Scenario Outline: ENG-11827 - Verify that the navigation bar adjusts to the logo's height (Logo's Height 120px)
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Theme Editor' option on 'Administration' page
    And I click on 'Change' link on 'Logo' section
    And I select the "<logo_path>" image
    When I click on the 'Save' button on 'Theme Editor' page
    Then I verify that the navigation bar moves up to adjust to the height
    And I verify that the Navigation bar is centered aligned

  Examples:
    | site                                   | user     | logo_path      |
    | Non-Challenge community - Theme Editor | autobot5 | logo_120px.jpg |
    | Challenge community - Theme Editor     | autobot5 | logo_120px.jpg |

  Scenario Outline: ENG-11828 - Theme Editor - Verify navigation bar Text Color can be changed
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Theme Editor' option on 'Administration' page
    Then I verify the 'Save' button is disabled on 'Theme Editor' page
    When I click on the Navigation Bar 'Text Color' circle
    Then I verify the color picker is displayed
    When I fill in the Hex color field with "<hex_code>" code
    Then I verify Hex color field value is "<hex_code>"
    Then I verify the 'Save' button is enabled on 'Theme Editor' page
    When I click on the 'Save' button on 'Theme Editor' page
    Then I verify "Theme settings saved!" popup message is displayed on 'Theme Editor' page
    And I verify the navigation bar text has "<hex_code>" color
    When I hover over the 'View Ideas' main menu tab
    # Then I verify that the Navigation Bar color is displayed 10% darker than the selected Brand <hex_color> Hex Color
  Examples:
    | site                                      | user     | hex_code |
    | Non-Challenge community - Admin Settings  | autobot5 | 428EFF   |

  Scenario Outline: ENG-11821 - Theme Editor - Verify that a different brand color can be selected and it is applied throughout the site
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
    And I verify "Theme settings saved!" popup message is displayed on 'Theme Editor' page
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

  Scenario Outline: ENG-11825 - Site Editor - Verify that a different link color can be selected and it is applied throughout the site (Typing Typing the HEX color)
    Given I login to "<site>" community with "<user>" user
    And I click on 'Administration' main menu tab
    When I click on 'Theme Editor' option on 'Administration' page
    Then I verify the 'Save' button is disabled on 'Theme Editor' page
    When I click on the 'Link Color' circle
    Then I verify the color picker is displayed
    When I fill in the Hex color field with "<hex_code>" code
    And I click on 'Ok' button in color picker
    And I verify the 'Save' button is enabled on 'Theme Editor' page
    When I click on the 'Save' button on 'Theme Editor' page
    And I verify "Theme settings saved!" popup message is displayed on 'Theme Editor' page
    When I click on 'View Ideas' main menu tab
    And I click on the "<idea_title>" idea on 'View Ideas' page
    Then I verify the idea's rating has "<hex_code>" color
    When I click on 'Home' main menu tab
    Then I verify the navigation bar has "<hex_code>" color
    And I verify the 'Ideas' tab has "<hex_code>" color
    When I click on 'Post Idea' main menu tab
    Then I verify 'Publish' button has "<hex_code>" color
    When I click on 'Challenges' main menu tab
    Then I verify that "first" challenge title link color is "<hex_code>" color when hovering a challenge's title
  @non-challenge
  Examples:
    | site                                      | user    | hex_code  | idea_title                    |
    | Non-Challenge community - Admin Settings  | admin1  | 7da3d6    | Community Idea AS-011 Votes 1 |
