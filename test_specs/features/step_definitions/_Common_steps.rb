And(/^I fill in "([^"]*)" field with the "([^"]*)"'s (.*) on "([^"]*)" page$/) do |field, user, info, page|
  if info == 'fullname'
    value = "#{@userUtil.getUser(user,'firstname')} #{@userUtil.getUser(user,'lastname')}"
  else
    value = @userUtil.getUser(user, info)
  end
  case page
    when 'Login' then
      @loginpage.fillValue(field, value)
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

# Click on a button on different pages
And(/^I click on the "([^"]*)" button in "([^"]*)" (page|popup)$/) do |button, page,_|
  case page
    when 'Login' then
      @loginpage.clickButton button
    else
      fail(ArgumentError.new("'#{page}' page is not listed."))
  end
end

And(/^I fill in the "([^"]*)" field with "([^"]*)" value on "([^"]*)" page$/) do |field, value, page|
  case page
    when 'Login' then
      @loginpage.fillValue(field, value)
    else
      fail(ArgumentError.new("'#{page}' field is not listed!"))
  end
end

Then(/^I verify that "([^"]*)" message (is|is not) displayed in "([^"]*)" page$/) do |message, is_displayed, page|
  displayed = is_displayed=='is'
  case page
    when 'Login','Forgot Username' then
      expect(@loginpage.verifyMessage(message)).to eq(displayed)

    else
      fail(ArgumentError.new("'#{page}' page is not listed."))
  end
end

And(/^I click on 'Administration' main menu tab$/) do
  @administrationpage = @homepage.clickAdministrationLink
end

When(/^I click on 'View Ideas' main menu tab$/) do
  # TODO: Update once the new View Ideas page is ready
  #@viewideaspage = @homepage.clickViewIdeasLink
end

And(/^I click on the "([^"]*)" idea on 'View Ideas' page$/) do |idea|
  # TODO: Update once the new View Ideas page is ready
  # @ideaDetailsPage = @viewideaspage.clickIdeaTitleLink(idea)
end

And(/^I click on 'Site Editor' option on 'Administration' page$/) do |option|
  # TODO - 2/10/2017 - WR - Complete this step on *Create test steps ENG-10487* task
end

When(/^I click on 'Home' main menu tab$/) do
  @homepage = @homepage.clickHomeLink
end

When(/^I click on 'Post Idea' main menu tab$/) do
  # TODO: Update once the new Post Idea page is ready
  #@postideapage = @homepage.clickPostIdeaLink
end

When(/^I click on 'Create Community' option on 'Administration' page$/) do
  @createcommunitypage = @administrationpage.clickCreateCommunityLink
end

And(/^I press "([^"]*)" key$/) do |key|
  current_element = page.driver.browser.switch_to.active_element
  current_element.send_keys key.to_sym
end

And(/^I click on 'Site Themes and Access Settings' option on 'Administration' page$/) do
  @sitethemesaccesssettingspage = @administrationpage.clickSiteThemesAccessSettingsLink
end

Then(/^I verify the user is redirected to the "([^"]*)" community's 'Home' page$/) do |url|
  #TODO:Update once new Home page is ready
end

And(/^I click on 'Manage Community' option on 'Administration' page$/) do
  @managecommunitypage = @administrationpage.clickManageCommunityLink
end

When(/^I click on 'Innovation Market' main menu tab$/) do
  @innovationmarketpage = @homepage.clickInnovationMarketLink
end

Then(/^I verify the 'Innovation Market' main menu tab (is|is not) displayed$/) do
  pending
end

And(/^I verify the 'Post Idea' main menu tab (is|is not) displayed$/) do
  pending
end

And(/^I click on 'Idea Template Editor' option on 'Administration' page$/) do
  @ideatemplateeditorpage = @administrationpage.clickIdeaTemplateEditorLink
end

Then(/^I verify "([^"]*)" (field|fields) (is|are) displayed on 'Idea Template Editor' page$/) do |fields_list, _, _|
  pending
end

And(/^I verify "([^"]*)" user has "([^"]*)" role$/) do |user, role|
  pending
end

And(/^I click on 'Permissions' option on 'Administration' page$/) do
  @permissionspage = @administrationpage.clickPermissionsLink
end

And(/^I verify "([^"]*)" option is selected in 'Permission Settings for Category Thread > Post Permissions' list on 'Permission Settings' page$/) do |option|
  pending
end

And(/^I verify "([^"]*)" option is selected in 'Permission Settings for Category Comment > Post Permissions' list on 'Permission Settings' page$/) do |option|
  pending
end

And(/^I verify 'Owner Can Delete Idea' setting is enabled on 'Idea Management' administration page$/) do
  pending
end