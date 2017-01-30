Given(/^I go to the "([^"]*)" site$/) do |site|
  @driverManager.getCommunity(@communityUtil.getCommunityUrl(site))
  @siteutil.setCurrentSite(site)
end

Then(/^I verify user is (.*) logged in$/) do |expected|
  loginResult = @loginpage.verifyUserIsLoggedIn

  case expected
    when "successfully" then
      fail(ArgumentError.new('User was not logged in!')) unless loginResult
    when "unsuccessfully" then
      fail(ArgumentError.new('User was logged in!')) unless not(loginResult)
  end
end

When(/^I login with "([^"]*)" username and "([^"]*)" password$/) do |user, password|
  @loginpage.loginToPage(user,password)
end