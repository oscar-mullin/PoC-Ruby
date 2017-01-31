Feature: LoginTest

  @Test
  Scenario Outline: Login to the site successfully
    Given I go to the "<site>" site
    When I login with "<user>" username and "<password>" password
  Examples:
    | site      | user      | password      |
    | Main Site | member1   | Spigit.123    |

  @Test
  Scenario Outline: Login to the site unsuccessfully
    Given I go to the "<site>" site
    When I login with "<user>" username and "<wrong_username>" password
    And I verify that "Username or password you entered is incorrect." message is displayed in "Login" page
    When I login with "<user>" username and "<password>" password
  Examples:
    | site      | user    | wrong_username  | password      |
    | Main Site | member1 | autoqa.1x       | Spigit.123    |
