class LoginPage < SitePrism::Page

  element :username_field, :xpath, ".//input[@id='username' or @id='j_username']"
  element :password_field, :xpath, ".//div[@class='password-field' or @class='form-element password']/input[@type='password']"
  element :forgotpwdusername_field, :xpath, ".//input[@name='username' or @id='password']"
  element :signin_button, :xpath, ".//div[button[text()='Sign In'] or a[@title='Sign in']]/*"
  element :signin_link, :xpath, ".//a[@href='/User/Login' and text()='Sign In']"
  element :reset_username_link, :xpath, ".//*[input[contains(@id,'username')]]/a"
  element :reset_password_link, :xpath, ".//a[contains(text(),'Forgot your password?')]"
  element :forgotusername_email_field, :xpath, ".//input[@id='username' or @name='email']"
  element :submit_button, :xpath, ".//*[text()='Submit' or text()='submit' or text()='SUBMIT']"
  element :cancel_button, :xpath, ".//*[text()='Cancel' or text()='CANCEL']" #generic cancel button
  element :loginrequest_container, :xpath, ".//div[contains(@class,'login-request-container') or contains(@class,'request-sent-container')]"
  element :forgot_usernamepwd_container, :xpath, ".//div[contains(@class,'login') and contains(@class,'container')]"
  element :errormessage_container, '.alert-danger'
  element :returnsignin_link, :xpath, ".//a[text()='Return to sign in']"
  element :yammersignin_button, :xpath, ".//*[img[contains(@src,'yammer.png')]]"
  element :newpassword_field, :xpath, ".//input[@id='password1' or @id='passwordNew']"
  element :enterpasswordagain_field, '#password2'
  element :resetpassword_container, '.reset-container'
  element :signinotheraccounts_container, :xpath, ".//div[contains(@class,'otherAccounts') and h2[text()='Sign in with other accounts?']]"
  element :adminaccess_link, :xpath, ".//a[contains(text(),'Need Administrator access? Click here to log in.')]"
  element :signin_container, '.signin-container'
  element :rememberusername_checkbox, "input[ng-model='login.rememberUserName']"

  def loginToPage(user, password)
    @util = Utils.new("")
    @userUtil = UserUtil.new
    username_field.set @userUtil.getUser(user, "username")
    password_field.set password
    signin_button.click
    @homepage = HomePage.new(".//body[@id='Home']")
    return @homepage
  end

  def verifyMessage(message)
    @util = Utils.new
    @util.elementExistsOnTime('css', '.alert-danger', 6)
    within errormessage_container do
      return has_text?(message)
    end
  end


end