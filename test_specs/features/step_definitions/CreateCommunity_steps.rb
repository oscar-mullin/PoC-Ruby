And(/^I fill in the 'URL' field on 'Create Community' page with "([^"]*)" value$/) do |value|
  @createcommunitypage.fillUrlField(value)
end

Then(/^I verify the 'Create Community' button is (enabled|disabled) on 'Create Community' page$/) do |enabled|
  is_enabled = enabled == 'enabled'
  expect(@createcommunitypage.createCommunityButtonEnabled?).to eq(is_enabled)
end

And(/^I verify "([^"]*)" error message is displayed on 'Create Community' page$/) do |message|
  expect(@createcommunitypage.verifyMessage(message)).to eq(true)
end

When(/^I click on the 'Create Community' button on 'Create Community' page$/) do
  @createcommunitypage.clickCreateCommunityButton
end

And(/^I select "([^"]*)" option from the 'Make child of' section$/) do |option|
  @createcommunitypage.selectParentCommunityOption(option)
end

Then(/^I verify 'Select a Community' link is not displayed under 'Existing Community' on the 'Make child of' section$/) do
  expect(@createcommunitypage.has_select_parent_comm_link?).to eq(false)
end

And(/^I select "([^"]*)" option from the 'Inherit Theme from' section$/) do |option|
  @createcommunitypage.selectInheritThemeFromOption(option)
end

Then(/^I verify 'Select a Community' link is not displayed under 'Existing Community' on the 'Inherit Theme from' section$/) do
  expect(@createcommunitypage.has_select_comm_theme_link?).to eq(false)
end

And(/^I select "([^"]*)" option from the 'Inherit Site Configuration from' section$/) do |option|
  @createcommunitypage.selectInheritSiteConfigFromOption(option)
end

Then(/^I verify 'Select a Template Community' link (is|is not) displayed under 'Template Community' on the 'Inherit Site Configuration from' section$/) do |displayed|
    is_displayed = displayed == 'is'
  expect(@createcommunitypage.has_select_template_siteconfig_link?).to eq(is_displayed)
end

And(/^I verify 'Select a Community' link (is not|is) displayed under 'Existing Community' on the 'Inherit Site Configuration from' section$/) do |displayed|
  is_displayed = displayed == 'is'
  expect(@createcommunitypage.has_select_comm_siteconfig_link?).to eq(is_displayed)
end

And(/^I fill in the 'Community Title' field on 'Create Community' page with "([^"]*)" value$/) do |value|
  @createcommunitypage.fillCommunityTitleField(value)
end

And(/^I fill in the 'Community Description' field on 'Create Community' page with "([^"]*)" value$/) do |value|
  @createcommunitypage.fillCommunityDescriptionField(value)
end

And(/^I fill in the 'Community Tags' field on 'Create Community' page with "([^"]*)" value$/) do |value|
  @createcommunitypage.fillCommunityTagsField(value)
end

Then(/^I verify 'Community Title' field value is "([^"]*)" on 'Site Themes and Access Settings' page$/) do |value|
  expect(@sitethemesaccesssettingspage.getCommunityTitle).to eq(value)
end

And(/^I verify 'Community Description' field value is "([^"]*)" on 'Site Themes and Access Settings' page$/) do |value|
  expect(@sitethemesaccesssettingspage.getCommunityDescription).to eq(value)
end

And(/^I verify 'Community Tags' field value is "([^"]*)" on 'Site Themes and Access Settings' page$/) do |value|
  expect(@sitethemesaccesssettingspage.getCommunityTags).to eq(value)
end

And(/^I click on the 'Select a Template Community' link on 'Inherit Site Configuration from' section$/) do
  @selectcommunitypopup = @createcommunitypage.clickInheritSiteConfigSelectCommLink
end

And(/^I click on the 'Select a Community' link on 'Inherit Site Configuration from' section$/) do
  @selectcommunitypopup = @createcommunitypage.clickInheritSiteConfigSelectCommLink
end

And(/^I select "([^"]*)" (community|template) from the '(Select a Community|Select a Template Community)' popup$/) do |community_title|
  @selectcommunitypopup.selectCommunity(community_title)
end

Then(/^I verify "([^"]*)" text is displayed on 'Inherit Site Configuration from' section$/) do |text|
  expect(@createcommunitypage.verifyInheritSiteConfigText(text)).to eq(true)
end

And(/^I select "([^"]*)" option from the 'Save as Template' section on 'Create Community' page$/) do |option|
  @createcommunitypage.selectSaveTemplateOption(option)
end

And(/^I verify 'Title' and 'Description' fields are displayed on 'Create Community' page$/) do
  expect(@createcommunitypage.has_template_title_field?).to eq(true)
  expect(@createcommunitypage.has_template_desc_textarea?).to eq(true)
end

And(/^I fill in the 'Title' field on 'Create Community' page with "([^"]*)" value$/) do |value|
  @createcommunitypage.fillTemplateTitleField(value)
end

When(/^I fill in the 'Description' field on 'Create Community' page with "([^"]*)" value$/) do |value|
  @createcommunitypage.fillTemplateDescriptionField(value)
end

Then(/^I verify "([^"]*)" title is displayed next to "([^"]*)" community on 'Manage Community' page$/) do |template_title, community_title|
  expect(has_xpath?(".//td[@class='siteNameColumn' and contains(.,'#{community_title}')]/following-sibling::td[1 and contains(.,'#{template_title}')]")).to eq(true)
end

Then(/^I verify "([^"]*)" (category|categories) (is|are) displayed on 'Innovation Market' page$/) do |categories_list, _, _|
  categories_list.split(',').each do |category|
    expect(@innovationmarketpage.categoryIsListed?(category)).to eq(true)
  end
end