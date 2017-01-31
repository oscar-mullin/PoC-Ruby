class EmailManager < SitePrism::Page

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

end