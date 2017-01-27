class Util < SitePrism::Page

  $xpath_verify_loginpage = ".//button[text()='Sign In']"
  $xpath_verify_activitystream = ".//ul[@id='activitystream' and (.//li or .//div[@class='no-results'])]"
  $xpath_verify_homepage = ".//*[contains(text(),'Headlines')]"
  $css_verify_createcomm_step1 = '#subdomain'
  $css_verify_createcomm_step2 = '#createCommWidgetFormStep2'
  $css_verify_createcomm_step3 = '#createCommWidgetFormStep3'
  $css_verify_createcomm_step4 = '#createCommWidgetFormStep4,#createCommWidgetFormStep5'
  $css_verify_createcomm_step5 = '#createCommWidgetFormStep5'
  $css_verify_createcomm_last = '.wysiwyg>h1,#activitystream>li,#activitystream>.no-results,.wysiwyg'
  $css_verify_createdchallenge = '#challengeSettingInfo'
  $css_verify_postcategorypage = '#content_ifr'
  $css_verify_viewsectorpage = '#view_sector_widget_fresh .category-heading'
  $css_verify_postideapage = '#idea-template iframe'
  $css_verify_viewideapage = '#view_idea_fresh'
  $css_verify_viewideaspage = '.list-results>div.loadingBar' #to verify loading bar is not displayed
  $css_verify_postcommenttinymce = 'iframe'
  $xpath_verify_movetocategory = ".//a[select[@name='newsectorid']]"
  $css_verify_userslist = '#users_list'
  $css_verify_administrationpage = '.admin .thumbnailsm>a'
  $css_verify_dpapage = '#configTbl'
  $css_verify_innovationmarketpage = '.communitylist'
  $css_verify_edituserpage = '.roleListWrapper'
  $css_verify_adduserpage = '#AdminAddUser'
  $css_verify_pairwisedialog = '#pairwiseSettingsForm'
  $css_verify_votingdialog = '#voteSettingsForm'
  $css_verify_newchallengepage = '#post_site_challenge'
  $css_verify_editchallengepage = '.challengePhaseProgress .bar .phase'
  $css_verify_challengespage = '#siteChallengeViewPort>ul'
  $css_verify_myprofilepage = '#tabified_user_profile_fresh ul>li'
  $css_verify_ideapopup = '#ideaDetailsDialog'
  $css_verify_evaluationtemplates = '#taskTemplatesFormId'
  $css_verify_newevaltemplate = '#name[name=title],#templateTitle'
  $css_verify_taskdialog = '#add-task-form'
  $css_verify_posttaskdialog = '#post-task-form,#review-form,#evaluation-form,#evaluationfile_form'
  $css_verify_create_form_page = '#evalForm'
  $css_verify_leaderboard = '#best_of_the_best>.panel-body'
  $css_verify_navigationdialog = '.navigate-confirm-dialog'
  $xpath_verify_allreviews = ".//table[@class='thread']/tbody[tr[contains(.,'All Reviews')]]"
  $css_verify_wait = '.css-not-found'

  $css_verify_ideadetails_screen = 'sp-idea-details div.userIdeaContent'
  $xpath_verify_home_screen = ".//div[sp-header[@title='home']]//sp-idea-list[.//ul or .//no-result-message]"
  $xpath_verify_challdetails_screen = ".//div[sp-header[@title='challenge.overview']]//sp-idea-list[.//ul or .//no-result-message]"
  $xpath_verify_login_successful = ".//*[text()='Home' or text()='Challenge Details' or @class='container landing-page ng-scope']"
  $xpath_verify_viewideas_screen = ".//div[.//h1[text()='View Ideas']]//ul[@class='list-container']"
  $xpath_verify_myideas_screen = ".//div[.//h1[text()='My Ideas']]//ul[@class='list-container']"
  $xpath_verify_topinnovators_screen = ".//div[.//h1[text()='Top Innovators']]//ul[contains(@class,'list-container')]"
  $xpath_verify_topideas_screen = ".//div[.//h1[text()='Most Popular']]//ul[contains(@class,'list-container')]"
  $xpath_verify_activity_screen = ".//div[.//h1[text()='Activity' or text()='Recent Activities']]//ul[contains(@class,'list-container')]"
  $xpath_verify_postidea_screen = ".//div[.//h1[text()='Post Idea']]//input[@id='title']"

  element :stayonpage_link, :xpath, ".//div[@class='navigate-confirm-dialog']//a[text()='Stay on this page']"
  element :leavepage_link, :xpath, ".//div[@class='navigate-confirm-dialog']//a[text()='Leave this Page']"
  element :datepickercurrentyear_label, :xpath, ".//*[@id='ui-datepicker-div']//span[@class='ui-datepicker-year']"
  element :datepickercurrentmonth_label, :xpath, ".//*[@id='ui-datepicker-div']//span[@class='ui-datepicker-month']"
  element :datepickernext_button, :xpath, ".//*[@id='ui-datepicker-div']//a[@title='Next']"
  element :datepickerprevious_button, :xpath, ".//*[@id='ui-datepicker-div']//a[@title='Prev']"

  # def getCommunity (url)
  #   self.class.set_url url
  #   page.driver.browser.manage.window.maximize
  #   self.load
  # end

  def getCurrentUser
    @@currentUser
  end

  def setCurrentUser(user)
    @@currentUser = user
  end

  def getCurrentIdea
    @@currentIdea
  end

  def setCurrentIdea(idea)
    @@currentIdea = idea
  end

  def getCurrentSite
    @@currentSite
  end

  def setCurrentSite(site)
    @@currentSite = site
  end

  def getIdeaTitle(idea)
    if !$devmod
      @@ideaTitles[idea]
    else
      return idea
    end
  end

  def getIdeaTitleHash
    @@ideaTitles
  end

  def setIdeaTitleHash(new_array)
    @@ideaTitles = new_array
  end

  def addIdeaTitle(idea)
    if !$devmod
      suffix = (Time.now.to_f*1000).to_i.to_s
      ideaTitle = idea + ' ' + suffix
      @@ideaTitles[idea] = ideaTitle
    else
      return idea
    end
  end

  def getCategoryTitle(category)
    if !$devmod
      @@categoryTitles[category]
    else
      return category
    end
  end

  def addCategoryTitle(category)
    if !$devmod
      categoryTitle = Forgery('lorem_ipsum').words(5, :random => true).capitalize
      @@categoryTitles[category] = categoryTitle
      return categoryTitle
    else
      return category
    end
  end

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

  # Generic method to open a mail, through subject/content, and click on a given link
  # unread: boolean to mark mail as unread or not
  def clickEmailLink(useraccount, password, subject, content, link, unread)
    $additionalContent = '' if $additionalContent.nil?
    retries = 0
    begin
      Gmail.connect(useraccount, password) do |gmail|
      # @@userUtil = UserUtil.new
      # gmail = @@userUtil.getSession(useraccount, password)
        gmail.inbox.emails(:unread, :subject => subject).each do |email|
          puts "Looking for '#{subject}' in gmail account..."
          if email.body.to_s.include?(content) and email.body.to_s.include?($additionalContent)
            unread ? email.mark(:unread) : email.mark(:read)

            @link = email.body.to_s[/<a.* href="(.*?)".*>.*#{link}.*<\/a>/,1] #try to find a link with the given text
            @link = email.body.to_s[/#{link}.*<a.*href="(.*?)".*/,1] if @link.nil? #if no link with the given text is found, try to find the link right after the given text
            @link = @link.gsub('amp;','')
            visit(@link)
            subject.include?('has requested to be a member of your team') ? sleep(1) : sleep(3)
            $additionalContent = nil #setting variable back to nil
            break
          else
            email.mark(:unread)
          end
        end
      end
    rescue OpenSSL::SSL::SSLError
      if retries < 3
        retries += 1
        puts "Error connecting to GMail Server, retry #{retries}"
        retry
      end
    end
  end

  # Generic method to change the read status of a mail, through subject/content
  # unread: boolean to mark mail as unread or not
  def changeLastMailReadStatus(useraccount, password, subject, content, unread)
    retries = 0
    begin
      Gmail.connect(useraccount, password) do |gmail|
        gmail.inbox.emails(unread ? :read : :unread, :subject => subject).each do |email|
          puts "Looking for '#{subject}' in gmail account..."
          if email.body.to_s.include?(content)
            unread ? email.mark(:unread) : email.mark(:read)
            return
          else
            email.mark(:unread) unless unread
          end
        end
      end
    rescue OpenSSL::SSL::SSLError
      if retries < 3
        retries += 1
        puts "Error connecting to GMail Server, retry #{retries}"
        retry
      end
    end
  end

  # Generic that returns whether a mail has a given content or not
  # content: regular expression
  # unread: boolean to mark mail as unread or not
  def mailHasContent(useraccount, password, subject, content, unread)
    retries = 0
    begin
      Gmail.connect(useraccount, password) do |gmail|
      # @@userUtil = UserUtil.new
      # gmail = @@userUtil.getSession(useraccount, password)
        puts "Looking for '#{subject}' in gmail account..."
        gmail.inbox.emails(:unread, :subject => subject).each do |email|
          if email.body.to_s =~ /#{content}/m
            unread ? email.mark(:unread) : email.mark(:read)
            return true
          else
            email.mark(:unread)
          end
        end
      end
    rescue OpenSSL::SSL::SSLError
      if retries < 3
        retries += 1
        puts "Error connecting to GMail Server, retry #{retries}"
        retry
      end
    end
    return false
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

  #CC
  # Method to verify if an email exists using the following parameters:
  # subject
  # site: url of the site
  # content: content to be searched
  # words not in the subject
  # keyword from the email sent
  # date after to search emails
  def verifyEmailWithContentSubjectWithoutKeywordsFromParamAfterDate(useraccount, password, subject, site, content, black_list, from_param, date)
    black_list_items = black_list.split(',')
    retries = 0
    begin
      Gmail.connect(useraccount, password) do |gmail|
      # @@userUtil = UserUtil.new
      # gmail = @@userUtil.getSession(useraccount, password)
        puts "Looking for '#{subject}' email..."

        emails = gmail.inbox.emails(:unread, :subject => subject, :from => from_param, :on => Date.parse(date))
        emails.each do |email|
          if black_list_items.include?(email.subject[/\[.*\]/m])
            email.mark(:unread)
          else
            if email.body.to_s.include?(site) and email.body.to_s.include?(content)
              email.mark(:read)
              message = "Email found with subject: '#{email.subject}'"
              return false, message
            else
              email.mark(:unread)
            end
          end
        end
      end
    rescue OpenSSL::SSL::SSLError
      if retries < 3
        retries += 1
        puts "Error connecting to GMail Server, retry #{retries}"
        retry
      end
    end
    return true,''
  end

  def getCountEmailsReceived(useraccount, password, subject)
    emailscounter = 0
    retries = 0
    begin
      Gmail.new(useraccount, password) do |gmail|
      # @@userUtil = UserUtil.new
      # gmail = @@userUtil.getSession(useraccount, password)
        puts "Looking for '#{subject}' in gmail account..."
        gmail.inbox.emails(:unread,:subject => subject).each do |email|
          if emailscounter == 0 then
            email.mark(:read)
            emailscounter = emailscounter + 1
            break
          end
        end
      end
    rescue OpenSSL::SSL::SSLError
      if retries < 3
        retries += 1
        puts "Error connecting to GMail Server, retry #{retries}"
        retry
      end
    end
    return emailscounter
  end

  def getNumberEmailsByContent(useraccount, password, subject, content)
    emailscounter = 0
    retries = 0
    begin
      Gmail.connect(useraccount, password) do |gmail|
      # @@userUtil = UserUtil.new
      # gmail = @@userUtil.getSession(useraccount, password)
        puts "Looking for '#{subject}' in gmail account..."
        gmail.inbox.emails(:unread, :subject => subject).each do |email|
          if email.body.to_s.include?(content)
            email.mark(:read)
            emailscounter = emailscounter + 1
            break
          else
            email.mark(:unread)
          end
        end
      end
    rescue OpenSSL::SSL::SSLError
      if retries < 3
        retries += 1
        puts "Error connecting to GMail Server, retry #{retries}"
        retry
      end
    end
    return emailscounter
  end

  def getNumberEmailsByContentAndUser(useraccount, password, subject, content, user_addressed)
    emailscounter = 0
    retries = 0
    begin
      Gmail.connect(useraccount, password) do |gmail|
      # @@userUtil = UserUtil.new
      # gmail = @@userUtil.getSession(useraccount, password)
        puts "Looking for '#{subject}' in gmail account..."
        gmail.inbox.emails(:unread, :subject => subject).each do |email|
          if email.body.to_s.include?(content) and email.body.to_s.include?(user_addressed)
            email.mark(:read)
            emailscounter = emailscounter + 1
            break
          else
            email.mark(:unread)
          end
        end
      end
    rescue OpenSSL::SSL::SSLError
      if retries < 3
        retries += 1
        puts "Error connecting to GMail Server, retry #{retries}"
        retry
      end
    end
    return emailscounter
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