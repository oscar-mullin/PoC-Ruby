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

Then(/^I verify 'Select a Template Community' link is not displayed under 'Template Community' on the 'Inherit Site Configuration from' section$/) do
  expect(@createcommunitypage.has_select_template_siteconfig_link?).to eq(false)
end

And(/^I verify 'Select a Community' link is not displayed under 'Existing Community' on the 'Inherit Site Configuration from' section$/) do
  expect(@createcommunitypage.has_select_comm_siteconfig_link?).to eq(false)
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