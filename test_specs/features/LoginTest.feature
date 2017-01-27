Feature: LoginTest

  @Test
  Scenario Outline: Login into the site successfully
    Given I go to the "<site>" site
    When I login with "<user>" username and "<password>" password
    Then I verify user is successfully logged in
  Examples:
    | site      | user      | password      |
    | Main Site | admin1    | Spigit.123    |

  @Test
  Scenario Outline: Login into the site unsuccessfully
    Given I go to the "<site>" site
    When I login with "<user>" username and "<wrong_username>" password
    Then I verify user is unsuccessfully logged in
    And I verify that "Username or password you entered is incorrect." message is displayed in "Login" page
    When I login with "<user>" username and "<password>" password
    Then I verify user is successfully logged in
  Examples:
    | site      | user   | wrong_username  | password      |
    | Main Site | admin1 | autoqa.1x       | Spigit.123    |