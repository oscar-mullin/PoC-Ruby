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

When(/^I click on Navigation Bar Text Color (circle|arrow)$/) do |nav_bar_color|
  # TODO - 2/13/2017 - WR - Complete this step on *Create test steps ENG-11828* task
end

When(/^I select (.*) color from the Color Wheel$/) do |new_color|
  # TODO - 2/13/2017 - WR - Complete this step on *Create test steps ENG-11828* task
end

Then(/^I verify that (.*) color from the Color Wheel can be selected$/) do |new_color|
  # TODO - 2/13/2017 - WR - Complete this step on *Create test steps ENG-11828* task
end

And(/^I verify that the Preview Navigation bar Text Color (is|is not) updated according to the selected color$/) do |display_option|
  # TODO - 2/13/2017 - WR - Complete this step on *Create test steps ENG-11828* task
end

When(/^I hover over the Navigation Bar$/) do
  # TODO - 2/13/2017 - WR - Complete this step on *Create test steps ENG-11828* task
end

Then(/^I verify that the Navigation Bar color is displayed 10% darker than the selected Brand (.*) Color$/) do |new_color|
  # TODO - 2/13/2017 - WR - Complete this step on *Create test steps ENG-11828* task
end

When(/^I fill the "Hex Color\#" field with a "(.*)" color code$/) do |new_color|
  pending
end

And(/^I verify that Link color preview is updated with "([^"]*)" code$/) do |new_color|
  # TODO
end

When(/^I click on 'Challenges' main menu tab$/) do
  # TODO
end

Then(/^I verify that challenge title link color is "([^"]*)" color when hovering a challenge's title$/) do |new_color|
  # TODO
end

When(/^I click on 'Theme Editor' option on 'Administration' page$/) do
  @themeeditorpage = @administrationpage.clickThemeEditorLink
end

Then(/^I verify the 'Save' button is (enabled|disabled) on 'Theme Editor' page$/) do |enabled|
  is_enabled = enabled == 'enabled'
  expect(@themeeditorpage.saveButtonEnabled?).to_eq(is_enabled)
end

When(/^I click on the 'Brand Color' circle$/) do
  @colorPickerPage = @themeditorpage.clickBrandColorButton
end

Then(/^I verify the color picker is displayed$/) do
  expect(@colorPickerPage.has_color_picker_container?).to_eq (true)
end

When(/^I fill in the Hex color field with "([^"]*)" code$/) do |code|
  @colorPickerPage.fillHexColorField(code)
end

Then(/^I verify Hex color field value is "([^"]*)"$/) do |code|
  expect(@colorPickerPage.getHexColorFieldValue).to_eq(code)
end

When(/^I click on the 'Save' button on 'Theme Editor' page$/) do
  @themeeditorpage.clickSaveButton
end

And(/^I verify "([^"]*)" popup message is displayed on 'Theme Editor' page$/) do |message|
  expect(@themeeditorpage.verifyMessage(message)).to_eq(true)
end

Then(/^I verify the idea's rating has "([^"]*)" color$/) do |color|
  #TODO
end

Then(/^I verify the navigation bar has "([^"]*)" color$/) do |color|
  #TODO
end

And(/^I verify the 'Ideas' tab has "([^"]*)" color$/) do |color|
  #TODO
end

Then(/^I verify 'Publish' button has "([^"]*)" color$/) do |color|
  #TODO
end