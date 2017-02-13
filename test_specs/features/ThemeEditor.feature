Feature: Theme Editor

  @Test
  Scenario Outline: ENG-11827 - Verify that the navigation bar adjusts to the logo's height (Logo's Height 30px)
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Theme Editor' option on 'Administration' page
    And I click on "Change" link on "Logo" section
    And I select the "<logo_path>" image
    When I click on "Save" button
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
    And I click on "Change" link on "Logo" section
    And I select the "<logo_path>" image
    When I click on "Save" button
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
    And I click on "Change" link on "Logo" section
    And I select the "<logo_path>" image
    When I click on "Save" button
    Then I verify that the navigation bar moves up to adjust to the height
    And I verify that the Navigation bar is centered aligned

  Examples:
    | site                                   | user     | logo_path      |
    | Non-Challenge community - Theme Editor | autobot5 | logo_120px.jpg |
    | Challenge community - Theme Editor     | autobot5 | logo_120px.jpg |

  @Test
  Scenario Outline: ENG-11827 - Verify that the navigation bar adjusts to the logo's height (Logo's Height 120px)
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Theme Editor' option on 'Administration' page
    And I click on "Change" link on "Logo" section
    And I select the "<logo_path>" image
    When I click on "Save" button
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
    Then I verify that the "Save" button is disabled
    When I click on Navigation Bar Text Color circle
    Then I verify that the "Color Wheel" is displayed
    When I select <new_color> color from the Color Wheel
    Then I verify that <new_color> color from the Color Wheel can be selected
    And I verify that the Preview Navigation bar Text Color is not updated according to the selected color
    And I verify that the "Save" button is enabled
    When I click on "Save" button
    Then I verify that the "Saved" confirmation message is displayed
    And I verify that the Navigation Bar is displayed with the <new_color> Color
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
    Then I verify that the "Save" button is disabled
    When I click on Navigation Bar Text Color circle
    Then I verify that the "Color Wheel" is displayed
    When I fill the "Hex Color#" field with a "<hex_color>" color code
    Then I verify that "<hex_color>" Hex color can be entered on the field
    And I verify that the "Save" button is enabled
    When I click on "Save" button
    Then I verify that the "Saved" confirmation message is displayed
    And I verify that the Navigation Bar is displayed with the <hex_color> Hex Color
    When I hover over the Navigation Bar
    Then I verify that the Navigation Bar color is displayed 10% darker than the selected Brand <hex_color> Hex Color

  Examples:
    | site                                   | user     | hex_color |
    | Non-Challenge community - Theme Editor | autobot5 | #428eff   |
    | Challenge community - Theme Editor     | autobot5 | #428eff   |
