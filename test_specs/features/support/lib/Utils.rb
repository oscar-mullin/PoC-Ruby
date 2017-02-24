class Utils
  include Capybara::DSL

  ##
  # @param [String] locator_type  Locator type
  # @param [String] locator       Locator path
  # @param [Integer] time         Time in seconds to wait for the element to show or not
  # @param [Boolean] is_displayed Whether to verify if the element is displayed or not
  #
  def self.elementDisplayedOnTime?(locator_type, locator, time, is_displayed)
    wait = Selenium::WebDriver::Wait.new(:timeout => time)
    begin
      wait.until {
        case locator_type.downcase
          when 'xpath' then
            is_displayed ? has_xpath?(locator) : has_no_xpath?(locator)
          when 'css' then
            is_displayed ? has_css?(locator) : has_no_css?(locator)
          when 'text' then
            is_displayed ? has_text?(locator) : has_no_text?(locator)
          when 'button' then
            is_displayed ? has_button?(locator) : has_no_button?(locator)
          when 'field' then
            is_displayed ? has_field?(locator) : has_no_field?(locator)
          when 'link' then
            is_displayed ? has_link?(locator) : has_no_link?(locator)
          when 'select' then
            is_displayed ? has_select?(locator) : has_no_select?(locator)
        end
      }
    rescue
      return false
    end
  end

  ##
  # @param [Integer] r
  # @param [Integer] g
  # @param [Integer] b
  #
  def self.getHexColorCode(r, g, b)
    hex_r = r.to_s(16).rjust(2, '0').upcase
    hex_g = g.to_s(16).rjust(2, '0').upcase
    hex_b = b.to_s(16).rjust(2, '0').upcase
    return hex_r + hex_g + hex_b
  end

  ##
  # @param [String] selector  Element selector
  # @param [String] property  Style property
  #
  def self.getElementStyleProperty(selector, property)
    script =  <<-JS
                var element = document.querySelector('#{selector}');
                var property_value = window.getComputedStyle(element, null).getPropertyValue('#{property}');
                return property_value;
              JS
    return Capybara.current_session.execute_script(script)
  end

  ##
  # @param [String] file_field  Element for the input field
  # @param [String] file        File name of the resource to be uploaded
  #
  def uploadFile(file_field, file)
    if $is_windows
      file_path = File.expand_path("resources/#{file}").gsub('/','\\')
    else
      file_path = File.expand_path("resources/#{file}")
    end
    if $browser == 'IE' and has_css?('.qq-upload-button>input')
      page.driver.browser.execute_script("document.querySelector('.qq-upload-button>input').style.opacity='100'")
    end
    file_field.set(file_path)
  end

  ##
  # @param [String] file        File name of the resource
  #
  # @return                     Array with the File dimensions on pixels as [Width, Height]
  def getFileDimensions(file)
    if $is_windows
      file_path = File.expand_path("resources/#{file}").gsub('/','\\')
    else
      file_path = File.expand_path("resources/#{file}")
    end
    return FastImage.size(file_path)
  end
end