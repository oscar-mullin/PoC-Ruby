Feature: Create Community

  #  Preconditions:
  #1. Have one challenge and non-challenge community created

  Scenario Outline: TC#1 - Create Community - Verify Submit button, existing url
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Create Community' option on 'Administration' page
    # empty
    And I fill in the 'URL' field on 'Create Community' page with "" value
    Then I verify the 'Create Community' button is disabled on 'Create Community' page
    # existing community
	And I fill in the 'URL' field on 'Create Community' page with "<community_url>" value
    And I press 'tab' key
    Then I verify the 'Create Community' button is enabled on 'Create Community' page
    And I verify "Name is in use, please enter another." error message is displayed on 'Create Community' page
    # existing challenge
    And I fill in the 'URL' field on 'Create Community' page with "<challenge_url>" value
	When I click on the 'Create Community' button on 'Create Community' page
    And I verify "Name is in use, please enter another." error message is displayed on 'Create Community' page    
  Examples:
    | site                                      | user        |
    | Non-Challenge community - Admin Settings  | superadmin  |

  Scenario Outline: TC#2 - Create Community - Verify creation of community with default settings (Private - Members Only)
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Create Community' option on 'Administration' page	
    # valid url	
    And I fill in the 'URL' field on 'Create Community' page with "<url>" value
    And I select "None" option from the 'Make child of' section
    Then I verify 'Select a Community' link is not displayed under 'Existing Community' on the 'Make child of' section
    And I select "None (default theme)" option from the 'Inherit Theme from' section
    Then I verify 'Select a Community' link is not displayed under 'Existing Community' on the 'Inherit Theme from' section
    And I select "None (default configuration)" option from the 'Inherit Site Configuration from' section
    Then I verify 'Select a Community' link is not displayed under 'Existing Community' on the 'Inherit Site Configuration from' section
    And I fill in the 'Community Title' field on 'Create Community' page with "<title>" value
    And I fill in the 'Community Description' field on 'Create Community' page with "<description>" value
    And I fill in the 'Community Tags' field on 'Create Community' page with "<tags>" value
    When I click on the 'Create Community' button on 'Create Community' page
    Then I verify the user is redirected to the "<title>" community's 'Activity' page
    When I click on 'Administration' main menu tab
    And I click on 'Site Themes and Access Settings' option on 'Administration' page
    Then I verify 'Community Title' field value is "<title>" on 'Site Themes and Access Settings' page
    And I verify 'Community Description' field value is "<title>" on 'Site Themes and Access Settings' page
    And I verify 'Community Tags' field value is "<title>" on 'Site Themes and Access Settings' page
  Examples:
    | site                                      | user        | title | description | tags  |
    | Non-Challenge community - Admin Settings  | superadmin  |       |             |       |
	
	
  #Preconditions:
  #1. Have a non-challenge community (Community A) with:
  #- Site structure (pages and page contents) different than the default
  #- From Admin>Site Editor page add the "Innovation Market" page as a main menu tab
  #- Administrator settings different than the default
  #- User roles and permission different than the default
  #- Categories created
  #2. The community of precondition 1 must not be saved as template

  Scenario Outline: TC#3 - Create Community - Verify community template creation using site configuratioin from another community
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Create Community' option on 'Administration' page
    And I fill in the 'URL' field on 'Create Community' page with "<template_url>" value
    And I select "None" option from the 'Make child of' section
    And I select "None (default theme)" option from the 'Inherit Theme from' section
    And I select "Existing community" option from the 'Inherit Site Configuration from' section
    And I select "<comm_site_config>" community to Inherit Site Configuration from
    Then I verify "<comm_site_config>" title is displayed next to 'Existing community' on 'Inherit Site Configuration' section
    And I fill in the 'Community Title' field on 'Create Community' page with "<title>" value
    And I select "Yes" option from the 'Save as Template' section on 'Create Community' page
    And I verify 'Title' and 'Description' fields are displayed on 'Create Community' page
    And I fill in the 'Title' field on 'Create Community' page with "" value
    And I press 'tab' key
    Then I verify the 'Create Community' button is disabled on 'Create Community' page
    When I fill in the 'Title' field on 'Create Community' page with "<template_title>" value
    When I fill in the 'Description' field on 'Create Community' page with "<template_desc>" value
    And I click on the 'Create Community' button on 'Create Community' page
    Then I verify the user is redirected to the "<title>" community's 'Activity' page
    When I click on 'Administration' main menu tab
    And I click on 'Manage Community' option on 'Administration' page
    Then I verify "<template_title>" is displayed next to "<title>" community on 'Your current communities' page
    # Break down in the different verifications needed
	And I verify that the new community has the site configuration of the selected community
    When I click on 'Innovation Market' main menu tab
    Then I verify "<categories_list>" category(ies) is(are) displayed on 'Innovation Market' page
  Examples:
    | site                                      | user        |
    | Non-Challenge community - Admin Settings  | superadmin  |
	
  #Preconditions:
  #1. Have a non-challenge community (Community A) with:
  #- Site structure (pages and page contents) different than the default
  #- From Admin>Site Editor page add the "Innovation Market" page as a main menu tab
  #- Administrator settings different than the default
  #- User roles and permission different than the default
  #- Categories created
  #2. Haave community of precondition 1 saved as community template

  Scenario Outline: TC#4 - Create Community - Verify community (Private - Required Login) creation using a template for site configuration
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Create Community' option on 'Administration' page
    And I fill in the 'URL' field on 'Create Community' page with "<url>" value
    And I select "None" option from the 'Make child of' section
    And I select "None (default theme)" option from the 'Inherit Theme from' section
    And I select "Template Community" option from the 'Inherit Site Configuration from' section
    Then I verify 'Select a Community' link is displayed under 'Template Community' on the 'Inherit Site Configuration from' section
    When I click on the 'Select a Template Community' link on 'Create Community' page
    Then I verify the existing template communities are displayed on the 'Select a Template Community' popup
    When I click on the 'Close' button on the 'Select a Template Community' popup
    Then I verify the 'Select a Template Community' popup is closed
    And I verify the 'Create Community' button is disabled on 'Create Community' page
    And I select "<template_title>" template to Inherit Site Configuration from
    Then I verify the 'Select a Template Community' popup is closed
    And I verify "<template_title>" title is displayed next to 'Template Community' on 'Inherit Site Configuration from' section
    And I verify the 'Create Community' button is disabled on 'Create Community' page
    And I select "Private - Required Login" option from the 'Community Access' dropdown on 'Create Community' page
    And I fill in the 'Community Title' field on 'Create Community' page with "<title>" value
    And I click on the 'Create Community' button on 'Create Community' page
    # Break down in the different verifications needed
    Then I verify the new community is created with the same site configuration than the selected template community
    When I click on 'Innovation Market' main menu tab
    Then I verify "<categories_list>" category(ies) is(are) displayed on 'Innovation Market' page
  Examples:
    | site                                      | user        |
    | Non-Challenge community - Admin Settings  | superadmin  |
		
	
  #Preconditions:
  #1. Have a non-challenge community
  #2. The community of precondition 1 must have some settings customized on Admin>Theme Editor page: e.g. setup a Brand Color, Button Text Color, Link Color with a different value than the default
  #3. On Administration>Site Editor page: "CommunityAttributes" page must be enabled as top level tab.

  Scenario Outline: TC#5 - Create Community - Verify theme is cloned to child challenge community
    Given I login to "<site>" community with "<user>" user
    When I create "<challenge_title>" challenge community
    And I verify the user is redirected to the "<title>" community's 'Home' page
    # Break down in the different verifications needed
    Then I verify the settings configured on the theme editor (Brand Color, Button Text Color, Link Color ) of the parent community are applied to the new challenge
    When I click on 'Administration' main menu tab
    When I click on 'Theme Editor' option on 'Administration' page
    #
    Then I verify the same customized settings of the parent community are displayed
  Examples:
    | site                                      | user        |
    | Non-Challenge community - Admin Settings  | superadmin  |

  #Preconditions:
  #1. Have a non-challenge community
  #2. The community of precondition 1 must have some settings customized on Admin>Theme Editor page: e.g. setup a Brand Color, Button Text Color, Link Color with a different value than the default
  #3. On Administration>Site Editor page: "CommunityAttributes" page must be enabled as top level tab.
  #4. On Community Attributes page: one field of each type must be created and setup as not required:
  #- Single Line Text
  #- Large Text Box
  #- Checkbox
  #- Radio Button
  #- Single Selection
  #- Multiple Selection
  #- Date

  Scenario Outline: TC#6 - Create Community - Verify theme is cloned to non-challenge community (Public) created with not-required community attributes
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Create Community' option on 'Administration' page
    And I fill in the 'URL' field on 'Create Community' page with "<url>" value
    And I select "Existing Community" option from the 'Inherit Theme from' section
    Then I verify 'Select a Community' link is displayed under 'Existing Community' on the 'Inherit Theme from' section
    When I click on the 'Select a Community' link on 'Create Community' page
    Then I verify the existing communities are displayed on the 'Select a Community' popup
    And I select "<template_title>" community to Inherit Theme from
    Then I verify the 'Select a Community' popup is closed
    And I verify "<template_title>" title is displayed next to 'Existing Community' on 'Inherit Theme from' section
    And I select "None (default configuration)" option from the 'Inherit Site Configuration from' section
    And I select "Public" option from the 'Community Access' dropdown on 'Create Community' page
    And I fill in the 'Community Title' field on 'Create Community' page with "<title>" value
    And I click on the 'Create Community' button on 'Create Community' page
    Then I verify the user is redirected to the "<title>" community's 'Activity' page
    And I click on 'Post Idea' main menu tab
    # Break down in the different verifications needed
    Then  I verify that the settings configured on the theme editor (Brand Color, Button Text Color, Link Color ) of the community selected as theme are applied to the new non-challenge community.
    When I click on 'Administration' main menu tab
    And I click on 'Theme Editor' option on 'Administration' page
    # Break down in the different verifications needed
    Then I verify that the same customized settings of the selected existing community are displayed
    When I click on 'Administration' main menu tab
    And I click on 'Site Themes and Access Settings' option on 'Administration' page
	Then I verify 'Single Line Text' field value is "" on 'Site Themes and Access Settings' page
    And I verify 'Large Text Box' field value is "" on 'Site Themes and Access Settings' page
    And I verify 'Checkbox' field is unselected on 'Site Themes and Access Settings' page
    And I verify 'Radio Button' field has "First" value selected on 'Site Themes and Access Settings' page
    And I verify 'Single Selection' field has "First" value selected on 'Site Themes and Access Settings' page
    And I verify 'Multiple Selection' field has "First" value selected on 'Site Themes and Access Settings' page
    And I verify 'Date' field value is "" on 'Site Themes and Access Settings' page
  Examples:
    | site                                      | user        |
    | Non-Challenge community - Admin Settings  | superadmin  |

  #Preconditions:
  #1. On Administration>Site Editor page: "CommunityAttributes" page must be enabled as top level tab.
  #2. On Community Attributes page: one field of each type must be created and setup as required:
  #- Single Line Text
  #- Large Text Box
  #- Checkbox
  #- Radio Button
  #- Single Selection
  #- Multiple Selection
  #- Date

  Scenario Outline: TC#7 - Create Community - Verify creation of community (Private - User Attribute) as child of another community with required community attributes
    Given I login to "<site>" community with "<user>" user
    When I click on 'Administration' main menu tab
    When I click on 'Create Community' option on 'Administration' page
    And I fill in the 'URL' field on 'Create Community' page with "<url>" value
    When I select "Existing community" option from the 'Make child of' section	
    And I select "<parent_comm>" community to Make child of
	And I verify "<parent_comm>" title is displayed next to 'Existing community' on 'Make child of' section
    And I select "None (default theme)" option from the 'Inherit Theme from' section
    And I select "None (default configuration)" option from the 'Inherit Site Configuration from' section
	When I select "Private - User Attribute" option from the 'Community Access' dropdown on 'Create Community' page	
    Then I verify the  "Please select the attribute(s) for the users who can access this community" section is displayed below the "Community Access" dropdown	
	And I verify the attribute filter is displayed with "Account Creation date After" selected on 'Create Community' page
	And I verify the operator filter is displayed with "Is" selected on 'Create Community' page
	And I verify the filter word field is displayed followed by "+" button on 'Create Community' page
	And I verify the "Expression Grouping" field is displayed on 'Create Community' page
	And I verify the "Preview Users" button is displayed on 'Create Community' page
	And I select "" option from the attribute filter dropdown on 'Create Community' page
	And I select "" option from the operator filter dropdown on 'Create Community' page
	And I fill in the filter word field on 'Create Community' page with "" value
	And I fill in the 'Expression Grouping' field on 'Create Community' page with "" value
    And I fill in the 'Community Title' field on 'Create Community' page with "<title>" value
    And I fill in the 'Single Line Text' field on 'Create Community' page with "<single_line_text>" value
    And I fill in the 'Large Text Box' field on 'Create Community' page with "<large_text_box>" value
    And I check the 'Checkbox' field on 'Create Community' page
    And I select "<radio_button>" option from the 'Radio Button' radio group on 'Create Community' page
    And I select "<single_selection>" option from the 'Single Selection' dropdown on 'Create Community' page
    And I select "<multiple_selection>" option from the 'Multiple Selection' list on 'Create Community' page
    And I fill in the 'Date' field on 'Create Community' page with "<date>" value
    And I click on the 'Create Community' button on 'Create Community' page
    Then I verify the user is redirected to the "<title>" community's 'Activity' page
	When I click on 'Administration' main menu tab
    And I click on 'Site Themes and Access Settings' option on 'Administration' page
    Then I verify the "<parent_comm>" community is displayed on "Make child of" section on 'Site Themes and Access Settings' page
    Then I verify 'Single Line Text' field value is "<single_line_text>" on 'Site Themes and Access Settings' page
    And I verify 'Large Text Box' field value is "<large_text_box>" on 'Site Themes and Access Settings' page
    And I verify 'Checkbox' field is <selected> on 'Site Themes and Access Settings' page
    And I verify 'Radio Button' field has "<radio_button>" value selected on 'Site Themes and Access Settings' page
    And I verify 'Single Selection' field has "<single_selection>" value selected on 'Site Themes and Access Settings' page
    And I verify 'Multiple Selection' field has "<multiple_selection>" value selected on 'Site Themes and Access Settings' page
    And I verify 'Date' field value is "<date>" on 'Site Themes and Access Settings' page
  Examples:
    | site                                      | user        |
    | Non-Challenge community - Admin Settings  | superadmin  |
	
	