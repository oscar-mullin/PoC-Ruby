class LoginPage < SitePrism::Page

  # element :username_field, '#username'
  # element :password_field, '#password'
  element :username_field, :xpath, ".//input[@id='username' or @id='j_username']"
  element :password_field, :xpath, ".//div[@class='password-field' or @class='form-element password']/input[@type='password']"
  element :forgotpwdusername_field, :xpath, ".//input[@name='username' or @id='password']"
  element :signin_button, :xpath, ".//div[button[text()='Sign In'] or a[@title='Sign in']]/*"
  element :signin_link, :xpath, ".//a[@href='/User/Login' and text()='Sign In']"
  element :reset_username_link, :xpath, ".//*[input[contains(@id,'username')]]/a"
  element :reset_password_link, :xpath, ".//a[contains(text(),'Forgot your password?')]"
  element :forgotusername_email_field, :xpath, ".//input[@id='username' or @name='email']"
  element :submit_button, :xpath, ".//*[text()='Submit' or text()='submit' or text()='SUBMIT']" #generic submit button
  element :cancel_button, :xpath, ".//*[text()='Cancel' or text()='CANCEL']" #generic cancel button
  element :loginrequest_container, :xpath, ".//div[contains(@class,'login-request-container') or contains(@class,'request-sent-container')]"
  element :forgot_usernamepwd_container, :xpath, ".//div[contains(@class,'login') and contains(@class,'container')]"
  element :errormessage_container, '.alert-danger'
  element :returnsignin_link, :xpath, ".//a[text()='Return to sign in']"
  element :yammersignin_button, :xpath, ".//*[img[contains(@src,'yammer.png')]]"
  element :newpassword_field, :xpath, ".//input[@id='password1' or @id='passwordNew']" # generic button
  element :enterpasswordagain_field, '#password2'
  element :resetpassword_container, '.reset-container'
  element :signinotheraccounts_container, :xpath, ".//div[contains(@class,'otherAccounts') and h2[text()='Sign in with other accounts?']]"
  element :adminaccess_link, :xpath, ".//a[contains(text(),'Need Administrator access? Click here to log in.')]"
  element :signin_container, '.signin-container'
  element :rememberusername_checkbox, "input[ng-model='login.rememberUserName']"

  def clickLink(link)
    @util = Util.new
    case link
      when 'Forgot your password?' then
        reset_password_link.click
      when 'Forgot your username?' then
        reset_username_link.click
      when 'Return to sign in' then
        returnsignin_link.click
      when 'Need Administrator access? Click here to log in.' then
        adminaccess_link.click
        @util.elementExistsOnTime('xpath', $xpath_verify_loginpage, 10)
      else
        fail(ArgumentError.new("'#{link}' is not listed!"))
    end
  end

  def clickButton(button)
    @util = Util.new
    case button
     when 'Sign In' then
        signin_button.click
        @util.elementNotDisplayed('xpath', $xpath_verify_loginpage, 3)
      when 'Submit' then
        submit_button.click
      when 'Cancel' then
        cancel_button.click
      when 'Change' then
        change_button.click
      else
        fail(ArgumentError.new("'#{button}' button is not listed!"))
    end
  end

  def fillValue(field, value)
    @userUtil = UserUtil.new
    case field
      when 'Username' then
        username_field.set value
      when 'Password' then
        password_field.set value
      when 'Forgot Username Email'
        forgotusername_email_field.set value
      when 'Forgot Password Username' then
        forgotpwdusername_field.set value
      when 'New Password' then
        newpassword_field.set value
      when 'Enter Password Again' then
        enterpasswordagain_field.set value
      when 'Confirm New Password' then
        confirmnewpassword_field.set value
      else
        fail(ArgumentError.new("'#{field}' field is not listed!"))
    end
  end

  def verifyMessage(message)
    @util = Util.new
    case message
      when  'Username or password you entered is incorrect.' then
        @util.elementExistsOnTime('css', '.alert-danger', 6)
        within errormessage_container do
          has_text?(message)
          end
      else
        fail(ArgumentError.new("'#{message}' is not listed!"))
    end
  end

  def verifyUserLoggedSuccesfully()
    @util.elementExistsOnTime('css', $css_verify_createcomm_last, 10)
    return current_url.include?($homePage)
  end
end