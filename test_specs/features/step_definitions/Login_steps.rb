Given(/^I go to the "([^"]*)" site$/) do |site|
  @driverManager.loadUrl(@communityUtil.getCommunityUrl(site))
  @siteutil.setCurrentSite(site)

end

Then(/^I verify user is (.*) logged in$/) do |expected|
  @loginpage.verifyUserIsLoggedIn

end

When(/^I login with "([^"]*)" username and "([^"]*)" password$/) do |user, password|
  @loginpage = LoginPage.new
  @loginpage.loginToPage(user,password)
end