Given(/^I navigate to the "([^"]*)" login page$/) do |site|
  @util.setPageUrl(@communities.getCommunityUrl(site))
  @util.setCurrentSite(site)
end

Then(/^I verify user is successfully logged in$/) do
  @util.elementExistsOnTime('css', $css_verify_createcomm_last, 10)
  fail(ArgumentError.new('User was not logged in!')) if current_url.include?('/User/Login')
end