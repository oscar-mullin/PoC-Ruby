require 'rubygems'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'gmail'
require 'report_builder'
require 'yaml'

$browser = ENV['BROWSER'] # IE, CH, FF

Dir::mkdir('output') if not File.directory?('output')
Dir::mkdir('output/screenshots') if not File.directory?('output/screenshots')

# TARGET = web, web_saucelabs, mobile, mobile_saucelabs
case ENV['TARGET']
  when 'web'
  case ENV['BROWSER']
    when 'CH' then
      Capybara.register_driver :chrome do |app|
        caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {'args' => [ '--disable-extensions' ]})
        if ENV['EXEC_TYPE']=='local'
          Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => caps)
        else
          Capybara::Selenium::Driver.new(app, :browser => :remote, :url => ENV['HUB_URL'], :desired_capabilities => caps)
        end

      end
      Capybara.default_driver = :chrome
      Capybara.javascript_driver = :chrome

    when 'IE' then
      Capybara.register_driver :selenium do |app|
        caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer({:takesScreenshot => true,
                                                                            :nativeEvents => false,
                                                                            :INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS => true,
                                                                            :IE_ENSURE_CLEAN_SESSION => true})
        if ENV['EXEC_TYPE']=='local'
          Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
        else
          Capybara::Selenium::Driver.new(app, :browser => :remote, :url => ENV['HUB_URL'], :desired_capabilities => caps)
        end


      end
      Capybara.default_driver = :selenium
      Capybara.javascript_driver = :selenium

    when 'FF' then
      Capybara.register_driver :selenium do |app|
        #Capybara::Selenium::Driver.new(app, :browser => :firefox)
        caps = Selenium::WebDriver::Remote::Capabilities.firefox(:unexpectedAlertBehaviour => 'ignore')
        if ENV['EXEC_TYPE']=='local'
          Capybara::Selenium::Driver.new(app, :browser => :firefox, :desired_capabilities => caps)
        else
          Capybara::Selenium::Driver.new(app, :browser => :remote,:url => ENV['HUB_URL'],:desired_capabilities => caps)
        end

      end
      Capybara.default_driver = :selenium
      Capybara.javascript_driver = :selenium
  end

  when 'bstack' then
      # walterramirez2:2VPEZp2WfGDL4XCxbRhT
      # alexandrchikanov1:DAbDkbm6MWp7MhmVzv4p
    TASK_ID = 0 #(ENV['TASK_ID'] || 0).to_i
    CONFIG_NAME = ENV['CONFIG_NAME'] || 'browserstack'

    CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../../bstackConfig/#{CONFIG_NAME}.config.yml")))
    CONFIG['user'] = ENV['BROWSERSTACK_USERNAME'] || CONFIG['user']
    CONFIG['key'] = ENV['BROWSERSTACK_ACCESS_KEY'] || CONFIG['key']

    Capybara.register_driver :browserstack do |app|
      @caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])

      # Code to start browserstack local before start of test
      if @caps['browserstack.local'] && @caps['browserstack.local'].to_s == 'true';
        @bs_local = BrowserStack::Local.new
        bs_local_args = {"key" => "#{CONFIG['key']}"}
        @bs_local.start(bs_local_args)
      end

      Capybara::Selenium::Driver.new(app,
                                     :browser => :remote,
                                     :url => "http://#{CONFIG['user']}:#{CONFIG['key']}@#{ENV['BROWSERSTACK_SERVER']}/wd/hub",
                                     :desired_capabilities => @caps
      )
    end

    Capybara.default_driver = :browserstack
    Capybara.run_server = false
end
#
# # monkey patch to avoid reset sessions
# class Capybara::Selenium::Driver < Capybara::Driver::Base
#   def reset!
#     if @browser
#       @browser.navigate.to('about:blank')
#     end
#   end
# end

Before do |scenario|
  puts "TC Start time: #{Time.now.strftime('%m/%d/%Y %H:%M%p')}"

  #region defined screen pages
  @userUtil = UserUtil.new
  @communityUtil = CommunityUtil.new
  @driverManager = DriverManager.new('','',0)
  @siteutil = SiteUtil.new
  #endregion
end

After do |scenario|
  if scenario.failed?
    case scenario
      when Cucumber::Core::Ast::Scenario
        @scenario_name = scenario.name
      else
        @scenario_name = scenario.scenario_outline.name
        #raise('Unhandled class')
    end
    sw = page.driver.browser
    encoded_img = sw.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}",'image/png')
    Dir::mkdir('output/screenshots') if not File.directory?('output')
    Dir::mkdir('output/screenshots') if not File.directory?('output/screenshots')
    screenshot = "output/screenshots/FAILED_#{@scenario_name.gsub(' ','_').gsub('|','_').gsub(/[^0-9A-Za-z_()]/, '')}_#{Time.new.strftime('%Y%m%d-%H%M%S')}.png"
    sw.save_screenshot(screenshot)
  end

  at_exit do
    @bs_local.stop unless @bs_local.nil?
    options = {
       json_path:    'output',
       report_path:  'output/MyTestResults',
       # report_path:  'output/MyTestResults_%DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%',
       report_types: ['html'],
       report_tabs:  ['overview', 'features', 'scenarios', 'errors'],
       report_title: 'My Test Results',
       compress_images: false,
       additional_info: {'browser' => 'Chrome', 'environment' => '2 features at once'}
     }

    ReportBuilder.build_report options
  end
end