Given(/^I go to the "([^"]*)" site$/) do |site|
  @driverManager.loadUrl(@communityUtil.getCommunityUrl(site))
  @siteutil.setCurrentSite(site)
  @loginpage = LoginPage.new(".//button[text()='Sign In']","xpath",20)
end

When(/^I login with "([^"]*)" (incorrect |)username and "([^"]*)" (incorrect |)password$/) do |username, incorrect_username, password, incorrect_password|
  successful_login = !(incorrect_username.include?('incorrect') or incorrect_password.include?('incorrect'))
  @loginpage.login(username, password, successful_login)
end

Given(/^I login to "([^"]*)" community with "([^"]*)" user$/) do |site, user|
  @driverManager.loadUrl(@communityUtil.getCommunityUrl(site))
  @siteutil.setCurrentSite(site)
  @loginpage = LoginPage.new(".//button[text()='Sign In']","xpath",20)
  @loginpage.loginWithReferences(user)
end

When(/^I make a Forgot Username request with "([^"]*)" user's email$/) do |user|
  @loginpage.makeForgotUsernameRequest(user)
end

When(/^I make a Forgot Password request with "([^"]*)" user$/) do |user|
  @loginpage.makeForgotPasswordRequest(user)
end

And(/^I verify "([^"]*)" text is displayed on the '(Forgot Username|Forgot Password)' page$/) do |text, _|
  if text.include?('Sent to')
    user_email = @userUtil.getUser(text[/user\((.*)\)/,1],'email')
    final_text = text.gsub(text[/(\[.*\])....@/,1], user_email[0,1])
    final_text = final_text.gsub(final_text[/@(\[.*\])/,1], user_email[/@(.*)/,1])
  end
  expect(@loginpage.verifyForgotUsernamePwdText(final_text)).to eq(true)
end

And(/^I verify that 'Return to (login|sign in)' link is displayed in '(Forgot Username|Forgot Password)' page$/) do |_,_|
  expect(@loginpage.verifyReturnToSignInLink).to eq(true)
end

And(/^I verify "([^"]*)" user received an email with "([^"]*)" subject$/) do |user, subject|
  emailacc = @userUtil.getUser(user,'email')
  emailpsw = @userUtil.getUser(user,'emailpsw')
  match = emailacc[/\+(.*?)@/m]
  emailacc = emailacc.gsub(match,'@') unless match.nil? #retrieving mail w/o alias
  emailmanager = EmailManager.new

  case subject
    when 'Username Request','Reset Password Request' then
      @inboxemails = emailmanager.getNoEmailsByContent(10, emailacc, emailpsw, subject, @userUtil.getUser(user,'username'))
    else
      fail(ArgumentError.new("'#{subject}' is not listed!"))
  end
  fail(ArgumentError.new("No '#{subject}' email was received!")) unless @inboxemails >= 1
end

When(/^I attempt to make a Forgot Username request with "([^"]*)" wrong email$/) do |wrong_email|
  @loginpage.attemptToMakeForgotUsernameRequestWithWrongEmail(wrong_email)
end

Then(/^I perform an unexpected action$/) do
  fail(ArgumentError.new('An unexpected action was made on Engage web app.'))
end