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

  @Test
  Scenario Outline: ENG-11828 - Verify navigation bar Text Color can be changed (From the Color Wheel)
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Theme Editor' option on 'Administration' page
    Then I verify the 'Save' button is disabled on 'Theme Editor' page
    When I click on Navigation Bar Text Color circle
    Then I verify the color picker is displayed
    When I select <new_color> color from the Color Wheel
    Then I verify that <new_color> color from the Color Wheel can be selected
    And I verify that the Preview Navigation bar Text Color is not updated according to the selected color
    And I verify the 'Save' button is enabled on 'Theme Editor' page
    When I click on the 'Save' button on 'Theme Editor' page
    Then I verify "Saved" popup message is displayed on 'Theme Editor' page
    And I verify the navigation bar has "<hex_code>" color
    When I hover over the Navigation Bar
    Then I verify that the Navigation Bar color is displayed 10% darker than the selected Brand <new_color> Color

  Examples:
    | site                                   | user     | new_color |
    | Non-Challenge community - Theme Editor | autobot5 | _         |
    | Challenge community - Theme Editor     | autobot5 | _         |

  @Test
  Scenario Outline: ENG-11828 - Verify navigation bar Text Color can be changed (Typing the HEX color)
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Theme Editor' option on 'Administration' page
    Then I verify the 'Save' button is disabled on 'Theme Editor' page
    When I click on Navigation Bar Text Color circle
    Then I verify the color picker is displayed
    When I fill in the Hex color field with "<hex_code>" code
    Then I verify Hex color field value is "<hex_code>"
    Then I verify the 'Save' button is enabled on 'Theme Editor' page
    When I click on the 'Save' button on 'Theme Editor' page
    Then I verify "Saved" popup message is displayed on 'Theme Editor' page
    And I verify the navigation bar has "<hex_color>" color
    When I hover over the Navigation Bar
    Then I verify that the Navigation Bar color is displayed 10% darker than the selected Brand <hex_color> Hex Color

  Examples:
    | site                                   | user     | hex_color |
    | Non-Challenge community - Theme Editor | autobot5 | #428eff   |
    | Challenge community - Theme Editor     | autobot5 | #428eff   |
