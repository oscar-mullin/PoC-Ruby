Given(/^I go to the "([^"]*)" site$/) do |site|
  @driverManager.getCommunity(@communityUtil.getCommunityUrl(site))
  @util.setCurrentSite(site)
end

Then(/^I verify user is (.*) logged in$/) do |expected|
  loginResult = @loginpage.verifyUserLoggedSuccesfully
  case expected
    when "successfully" then
      fail(ArgumentError.new('User was not logged in!')) unless loginResult
    when "unsuccessfully" then
      fail(ArgumentError.new('User was logged in!')) unless not(loginResult)
  end
end


When(/^I login with "([^"]*)" username and "([^"]*)" password$/) do |user, password|
  @loginpage.fillValue("Username", @userUtil.getUser(user, "username"))
  @loginpage.fillValue("Password", password)
  @loginpage.clickButton "Sign In"
end