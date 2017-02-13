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
  #TODO
end

When(/^I click on 'View Ideas' main menu tab$/) do
  #TODO
end

And(/^I click on the "([^"]*)" idea on 'View Ideas' page$/) do |idea|
  #TODO
end

When(/^I click on 'Home' main menu tab$/) do
  #TODO
end

When(/^I click on 'Post Idea' main menu tab$/) do
  #TODO
end