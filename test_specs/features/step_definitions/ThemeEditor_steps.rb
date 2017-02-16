And(/^I click on 'Change' link on 'Logo' section$/) do
  # TODO - 2/13/2017 - WR - Complete this step on *Create test steps ENG-11827* task
end

And(/^I select the "([^"]*)" image$/) do |image_path|
  # TODO - 2/13/2017 - WR - Complete this step on *Create test steps ENG-11827* task
end

Then(/^I verify that the navigation bar moves up to adjust to the height$/) do
  # TODO - 2/13/2017 - WR - Complete this step on *Create test steps ENG-11827* task
end

And(/^I verify that the Navigation bar is centered aligned$/) do
  # TODO - 2/13/2017 - WR - Complete this step on *Create test steps ENG-11827* task
end

When(/^I click on the Navigation Bar 'Text Color' circle$/) do
  @colorPickerPage = @themeditorpage.clickNavbarTextColorButton
end

When(/^I hover over the 'View Ideas' main menu tab$/) do
  @homepage.hoverViewIdeasLink
end

Then(/^I verify the selected main menu tab color is displayed (\d+)% darker than the selected color$/) do |percentage|
  brightness_value = @utils.getElementStyleProperty('.navHolder a:hover','filter')[/brightness\((.*)\)/,1]
  expect(100 - (brightness_value.to_f*100)).to eq(percentage.to_i)
end

And(/^I verify that Link color preview is updated with "([^"]*)" code$/) do |new_color|
  # TODO
end

When(/^I click on 'Challenges' main menu tab$/) do
  # TODO: Update once the new Challenges page is ready
  #@challengespage = @homepage.clickChallengesLink
end

Then(/^I verify that "([^"]*)" challenge title link color is "([^"]*)" color when hovering a challenge's title$/) do |challenge,color|
  # TODO: Update once the new Challenges page is ready
  # style = @challengespage.getTitleAttribute('style')
  # bg_color = style[/background-color: (.*)\; color/,a]
  # r_value = bg_color[/rgb\((\d+), \d+, \d+, \d+\)/,1].to_i
  # g_value = bg_color[/rgb\(\d+, (\d+), \d+, \d+\)/,1].to_i
  # b_value = bg_color[/rgb\(\d+, \d+, (\d+), \d+\)/,1].to_i
  # hex_color = @utils.getHexColorCode(r_value, g_value, b_value)
  # expect(hex_color).to_eq(color)
end

When(/^I click on 'Theme Editor' option on 'Administration' page$/) do
  @themeeditorpage = @administrationpage.clickThemeEditorLink
end

Then(/^I verify the 'Save' button is (enabled|disabled) on 'Theme Editor' page$/) do |enabled|
  is_enabled = enabled == 'enabled'
  expect(@themeeditorpage.saveButtonEnabled?).to eq(is_enabled)
end

When(/^I click on the 'Brand Color' circle$/) do
  @colorpickerpage = @themeeditorpage.clickBrandColorButton
end

When(/^I click on the 'Link Color' circle$/) do
  @colorpickerpage = @themeeditorpage.clickLinkColorButton
end

Then(/^I verify the color picker is displayed$/) do
  expect(@colorpickerpage.has_color_picker_container?).to eq(true)
end

When(/^I fill in the Hex color field with "([^"]*)" code$/) do |code|
  @colorpickerpage.fillHexColorField(code)
end

Then(/^I verify Hex color field value is "([^"]*)"$/) do |code|
  expect(@colorpickerpage.getHexColorFieldValue).to eq(code)
end

When(/^I click on the 'Save' button on 'Theme Editor' page$/) do
  @themeeditorpage.clickSaveButton
end

And(/^I verify "([^"]*)" popup message is displayed on 'Theme Editor' page$/) do |message|
  expect(@themeeditorpage.verifyMessage(message)).to eq(true)
end

Then(/^I verify the idea's rating has "([^"]*)" color$/) do |color|
  #TODO: New Idea Deatails page is not ready yet
end

Then(/^I verify the navigation bar has "([^"]*)" color$/) do |color|
  bg_color = @homepage.getNavigationBarContainerStyle('background-color')
  r_value = bg_color[/rgba\((\d+), \d+, \d+, \d+\)/,1].to_i
  g_value = bg_color[/rgba\(\d+, (\d+), \d+, \d+\)/,1].to_i
  b_value = bg_color[/rgba\(\d+, \d+, (\d+), \d+\)/,1].to_i
  hex_color = @utils.getHexColorCode(r_value, g_value, b_value)
  expect(hex_color).to eq(color)
end

And(/^I verify the 'Ideas' tab has "([^"]*)" color$/) do |color|
  #TODO: New Home page is not ready yet
end

Then(/^I verify 'Publish' button has "([^"]*)" color$/) do |color|
  style = @postideapage.getPublishButtonAttribute('style')
  bg_color = style[/background-color: (.*)\; color/,a]
  r_value = bg_color[/rgb\((\d+), \d+, \d+, \d+\)/,1].to_i
  g_value = bg_color[/rgb\(\d+, (\d+), \d+, \d+\)/,1].to_i
  b_value = bg_color[/rgb\(\d+, \d+, (\d+), \d+\)/,1].to_i
  hex_color = @utils.getHexColorCode(r_value, g_value, b_value)
  expect(hex_color).to eq(color)
end

And(/^I verify the navigation bar text has "([^"]*)" color$/) do |color|
  bg_color = @homepage.getNavigationBarLinkStyle('color')
  r_value = bg_color[/rgba\((\d+), \d+, \d+, \d+\)/,1].to_i
  g_value = bg_color[/rgba\(\d+, (\d+), \d+, \d+\)/,1].to_i
  b_value = bg_color[/rgba\(\d+, \d+, (\d+), \d+\)/,1].to_i
  hex_color = @utils.getHexColorCode(r_value, g_value, b_value)
  expect(hex_color).to eq(color)
end

And(/^I click on 'Ok' button in color picker$/) do
  @colorpickerpage.clickOKButton
end