Feature: Login

  @Test
  Scenario Outline: Login to the site successfully/unsuccessfully
    Given I go to the "<site>" site
    When I login with "<wrong_username>" incorrect username and "<password>" password
    And I verify that "Username or password you entered is incorrect." message is displayed in "Login" page
    Then I login with "<user>" username and "<password>" password
  Examples:
    | site      | user      | wrong_username  | password      |
    | Main Site | autobot1  | autobot1x       | Spigit.123    |

  @Test
  Scenario Outline: Verify user receives Username Request email notification
    Given I go to the "<site>" site
    When I make a Forgot Username request with "<user>" user's email
    Then I verify "Request Sent!" text is displayed on the 'Forgot Username' page
    And I verify "We have emailed your username to the email address that we have on file." text is displayed on the 'Forgot Username' page
    And I verify that 'Return to sign in' link is displayed in 'Forgot Username' page
    And I verify "<user>" user received an email with "Username Request" subject
  Examples:
    | site      | user    |
    | Main Site | member1 |

  @P1
  Scenario Outline: Verify user receives Forgot Password email notification
    Given I go to the "<site>" site
    When I make a Forgot Password request with "<user>" user
    Then I verify "Request Sent!" text is displayed on the 'Forgot Password' page
    And I verify "Please follow the instructions in your email to continue." text is displayed on the 'Forgot Password' page
    And I verify "Sent to: [user(<user>) email first letter]****@[email domain]" text is displayed on the 'Forgot Password' page
    And I verify that 'Return to login' link is displayed in 'Forgot Password' page
    And I verify "<user>" user received an email with "Reset Password Request" subject
  Examples:
    | site      | user    |
    | Main Site | member1 |
