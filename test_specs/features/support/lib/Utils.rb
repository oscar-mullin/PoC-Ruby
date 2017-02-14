class Utils

  def elementExistsOnTime(selector, path, time)
    wait = Selenium::WebDriver::Wait.new(:timeout => time) # seconds
    begin
      wait.until {
        case selector.downcase
          when 'xpath' then
            has_xpath?(path)
          when 'css' then
            has_css?(path)
          when 'text' then
            has_text?(path)
          when 'button' then
            has_button?(path)
          when 'checked_field' then
            has_checked_field?(path)
          when 'field' then
            has_field?(path)
          when 'link' then
            has_link?(path)
          when 'select' then
            has_select?(path)
        end
      }
    rescue
      return false
    end
  end
end