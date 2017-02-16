require 'site_prism/loadable'

module SitePrism
  class Page

    def initialize(locator, locator_type,time)
      unless locator.empty? and locator_type.empty?
        wait = Selenium::WebDriver::Wait.new(:timeout => time) # seconds
        begin
          wait.until {
            case locator_type.downcase
              when 'xpath' then
                has_xpath?(locator)
              when 'css' then
                has_css?(locator)
              when 'text' then
                has_text?(locator)
              when 'button' then
                has_button?(locator)
              when 'checked_field' then
                has_checked_field?(locator)
              when 'field' then
                has_field?(locator)
              when 'link' then
                has_link?(locator)
              when 'select' then
                has_select?(locator)
              else
                fail(ArgumentError.new("Locator type #{locator_type} not supported."))
            end
          }
        rescue
          fail(ArgumentError.new("Error when accessing Page."))
        end
      end
    end

  end
end
