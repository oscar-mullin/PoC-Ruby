
class EmailManager

  def getNoEmailsByContent(wait_time, useraccount, password, subject, content)
    sleep 10
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

end