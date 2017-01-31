class Utils < SitePrism::Page

  element :datepickercurrentyear_label, :xpath, ".//*[@id='ui-datepicker-div']//span[@class='ui-datepicker-year']"
  element :datepickercurrentmonth_label, :xpath, ".//*[@id='ui-datepicker-div']//span[@class='ui-datepicker-month']"
  element :datepickernext_button, :xpath, ".//*[@id='ui-datepicker-div']//a[@title='Next']"
  element :datepickerprevious_button, :xpath, ".//*[@id='ui-datepicker-div']//a[@title='Prev']"

  def waitForElement(selector, path, time)
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
      fail(ArgumentError.new("Unable to find '#{path}' #{selector} for #{time} seconds!"))
    end
  end

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

  def elementNotDisplayed(selector, path, time)
    wait = Selenium::WebDriver::Wait.new(:timeout => time) # seconds
    begin
      wait.until {
        case selector.downcase
          when 'xpath' then
            has_no_xpath?(path)
          when 'css' then
            has_no_css?(path)
          when 'text' then
            has_no_text?(path)
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

  # Uploads a file setting the path in an input field
  def uploadFile(file_field, file)
    if $is_windows
      file_path = File.expand_path("resources/#{file}").gsub('/','\\')
    else
      file_path = File.expand_path("resources/#{file}")
    end
    if $browser == 'IE' and has_css?('.qq-upload-button>input')
      #page.driver.browser.execute_script("document.querySelector('.qq-upload-button>input').style.visibility='visible'")
      page.driver.browser.execute_script("document.querySelector('.qq-upload-button>input').style.opacity='100'")
    end
    file_field.set(file_path)
  end

  # Method to retrieve the username according to User Experience Management configuration.
  def getUsernameAccordingUserExperienceManagementConfig(user)
    @userUtil = UserUtil.new
    username = @userUtil.getUser(user, 'username')
    firstname = @userUtil.getUser(user, 'firstname')
    lastname = @userUtil.getUser(user, 'lastname')
    nickname = @userUtil.getUser(user, 'nickname').nil? ? '' : @userUtil.getUser(user, 'nickname')
    useremail = @userUtil.getUser(user, 'email')
    name = ($showfullname)? (firstname + ' ' + lastname) : username
    nick = ($shownickname)? (($showfullname)? (nickname + ' ' + lastname) : nickname): name
    email = ($showemail)? ', ' + useremail : ''
    return (nick + email)
  end

  # Looks for an xpath through all pages of a section
  def elementExistsThroughPages(element_xpath, section)
    case section
      when 'Top Search','Idea Stage Page' then
        @nextpagebutton = ".//div[@class='jumpButtons']/a[@class='jumpToBack']"
      else
        fail(ArgumentError.new("'#{section}' is not listed!"))
    end

    page_index = 1
    begin
      next_page_exists = has_xpath?(@nextpagebutton)
      if has_xpath?(element_xpath)
        return true
      elsif has_xpath?(@nextpagebutton)
        find(:xpath,@nextpagebutton).click
        page_index += 1
        elementExistsOnTime('xpath', ".//div[@class='jumpButtons']/span/strong[text()='#{page_index}']", 3)
      else
        return false
      end
    end until !next_page_exists
  end

  # returns alert if an alert is found
  def alert_present?(wait_time)
    waitTime = Time.now + wait_time
    while Time.now < waitTime
      begin
        page.driver.browser.switch_to.alert
        return page.driver.browser.switch_to.alert
      rescue
        @alert_found = false
      end
    end
    puts 'No alert found...'
    return nil
  end

  def closeAlertWindow(value, wait_time)
    sleep wait_time
    if value
      page.driver.browser.switch_to.alert.accept
    else
      page.driver.browser.switch_to.alert.dismiss
    end
    # please do not add any sleep
  end

  def changeNumberToLiteral(number)
    names = ['Zero','One','Two','Three','Four','Five','Six','Seven','Eight','Nine']

    aux = number.to_s.split('')
    literal = ''
    aux.each do|char|
      literal += names[(char.to_i)]
    end
    return literal
  end

  def getCurrentdate
    dayValue = DateTime.now.day.to_s.length==1? '0' + DateTime.now.day.to_s : DateTime.now.day.to_s
    monthValue = DateTime.now.month.to_s.length==1? '0' + DateTime.now.month.to_s : DateTime.now.month.to_s
    dateValue = monthValue + '/' + dayValue + '/' + DateTime.now.year.to_s
    return dateValue
  end

  def selectDateFromDatePicker(date_to_pick)
    months = %w(January February March April May June July August September October November December)
    dateArray = date_to_pick.split('/')
    day = dateArray[1]
    month = dateArray[0]
    year = dateArray[2]

    #Manage the picker to reach specified year
    if year.to_i > datepickercurrentyear_label.text.to_i
      while datepickercurrentyear_label.text.to_i < year.to_i  do
        datepickernext_button.click
      end
    elsif year.to_i < datepickercurrentyear_label.text.to_i
      while datepickercurrentyear_label.text.to_i > year.to_i  do
        datepickerprevious_button.click
      end
    end
    #Manage the picker to reach specified month
    if month.to_i > (months.index(datepickercurrentmonth_label.text)+1)
      while month.to_i > (months.index(datepickercurrentmonth_label.text)+1) do
        datepickernext_button.click
      end
    elsif month.to_i < (months.index(datepickercurrentmonth_label.text)+1)
      while month.to_i < (months.index(datepickercurrentmonth_label.text)+1) do
        datepickerprevious_button.click
      end
    end
    find(:xpath, ".//table[@class='ui-datepicker-calendar']//a[text()='#{day.to_i}']").click
  end

  def in_browser(name)
    @old_session = Capybara.session_name
    Capybara.session_name = name
    yield
    Capybara.session_name = @old_session
  end

  def waitAmountMinutes(minutes)
    waitTime = Time.now + (minutes*60)
    while Time.now < waitTime do
    end
  end

  def refreshPage
    visit(current_url)
  end

  def scrollWidgetUntilElementFound(widget, xpathElement)
    idWidget = case widget
                 when 'Available Communities List' then '.jspContainer'
                 when 'Challenges' then '#siteChallengeViewPort'
                 when 'Bulk Actions Ideas Listed' then '#ideaList'
                 when 'View Ideas' then '#viewIdeasViewPort'
               end
    outerHeight = page.execute_script("return $('#{idWidget}').outerHeight();")
    scrollHeight = page.execute_script("return $('#{idWidget}').get(0).scrollHeight;")
    scrollTop = page.execute_script("return $('#{idWidget}').scrollTop();")
    y = 400
    contentFound = has_xpath?(xpathElement)
    while ((scrollTop+outerHeight) < scrollHeight) and !contentFound do
      page.execute_script("$('#{idWidget}').scrollTop(#{y})")
      scrollTop = page.execute_script("return $('#{idWidget}').scrollTop();")
      elementExistsOnTime('xpath', xpathElement, 5)
      within(idWidget) do
        contentFound = has_xpath?(xpathElement)
      end
      y += 400
    end
  end

  def scrollScreenUntilItemFound(xpath,no_attempts)
    attempts = 0
    while attempts < no_attempts
      if has_xpath?(xpath)
        return true
      else
        attempts += 1
        scrollHeight = execute_script('return window.innerHeight')
        execute_script("window.scrollBy(0,#{scrollHeight});")
      end
    end
    return false
  end

  def getCurrentTimezone
    if Time.now.zone == 'SA Western Standard Time' or Time.now.zone == 'BOT'
      'EDT'
    else
      $timezone_USA
    end
  end
end