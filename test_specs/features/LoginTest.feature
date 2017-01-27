Feature: LoginTest

  @Test
  Scenario Outline: Login into the site successfully
    Given I navigate to the "<site>" login page
    And I fill in "Username" field with the "<user>"'s username on "Login" page
    And I fill in "Password" field with the "<user>"'s password on "Login" page
    And I click on the "Sign In" button in "Login" page
    Then I verify user is successfully logged in
  Examples:
    | site      | user   |
    | Main Site | admin1 |

  @Test
  Scenario Outline: Login into the site unsuccessfully
    Given I navigate to the "<site>" login page
    When I fill in the "Username" field with "<wrong_username>" value on "Login" page
    And I fill in "Password" field with the "<user>"'s password on "Login" page
    And I click on the "Sign In" button in "Login" page
    Then I verify that "Username or password you entered is incorrect." message is displayed in "Login" page
    Given I navigate to the "<site>" login page
    And I fill in "Username" field with the "<user>"'s username on "Login" page
    And I fill in "Password" field with the "<user>"'s password on "Login" page
    And I click on the "Sign In" button in "Login" page
    Then I verify user is successfully logged in
  Examples:
    | site      | user   | wrong_username  |
    | Main Site | admin1 | autoqa.1x       |
