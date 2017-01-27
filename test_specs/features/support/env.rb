require 'rubygems'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
#require 'site_prism/waiter'

$browser = 'IE' # IE, CH, FF

  case $browser
    when 'CH' then
      Capybara.register_driver :chrome do |app|
        caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {'args' => [ '--disable-extensions' ]})
        Capybara::Selenium::Driver.new(app, :browser => :remote, :url => 'http://127.0.0.1:4445/wd/hub', :desired_capabilities => caps)
      end
      Capybara.default_driver = :chrome
      Capybara.javascript_driver = :chrome

    when 'IE' then
      Capybara.register_driver :selenium do |app|
        caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer({:takesScreenshot => true,
                                                                            :nativeEvents => false,
                                                                            :INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS => true,
                                                                            :IE_ENSURE_CLEAN_SESSION => true})
        Capybara::Selenium::Driver.new(app, :browser => :remote, :url => 'http://127.0.0.1:4445/wd/hub', :desired_capabilities => caps)
      end
      Capybara.default_driver = :selenium
      Capybara.javascript_driver = :selenium

    when 'FF' then
      Capybara.register_driver :selenium do |app|
        #Capybara::Selenium::Driver.new(app, :browser => :firefox)
        caps = Selenium::WebDriver::Remote::Capabilities.firefox(:unexpectedAlertBehaviour => 'ignore')
        Capybara::Selenium::Driver.new(app, :browser => :remote,
                                       :url => 'http://127.0.0.1:4445/wd/hub',
                                       :desired_capabilities => caps)
      end
      Capybara.default_driver = :selenium
      Capybara.javascript_driver = :selenium
  end

Before do |scenario|
  puts "TC Start time: #{Time.now.strftime('%m/%d/%Y %H:%M%p')}"

  #region defined screen pages
  @loginpage = LoginPage.new
  @users = Users.new
  @communities = Communities.new
  @util = Util.new
  #endregion

end

After do |scenario|
  if scenario.failed?
    case scenario
      when Cucumber::Core::Ast::Examples
        @scenario_name = scenario.scenario_outline.name
      when Cucumber::Core::Ast::Scenario
        @scenario_name = scenario.name
      else
        raise('Unhandled class')
    end
    sw = page.driver.browser
    encoded_img = sw.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}",'image/png')
    Dir::mkdir('output/screenshots') if not File.directory?('output/screenshots')
    screenshot = "output/screenshots/FAILED_#{@scenario_name.gsub(' ','_').gsub('|','_').gsub(/[^0-9A-Za-z_()]/, '')}_#{Time.new.strftime('%Y%m%d-%H%M%S')}.png"
    sw.save_screenshot(screenshot)
  end
end