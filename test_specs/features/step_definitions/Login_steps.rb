Given(/^I go to the "([^"]*)" site$/) do |site|
  @driverManager.loadUrl(@communityUtil.getCommunityUrl(site))
  @siteutil.setCurrentSite(site)
  @loginpage = LoginPage.new(".//button[text()='Sign In']")
end

When(/^I login with "([^"]*)" username and "([^"]*)" password$/) do |user, password|
  @loginpage.loginToPage(user,password)
end