class Users
  @@users = Hash.new { |h,k| h[k] = {} }
  @@users['superadmin']['username'] = 'admin'
  @@users['superadmin']['password'] = 'farmtotable123'
  @@users['superadmin']['firstname'] = 'Spigit'
  @@users['superadmin']['lastname'] = 'Administrator'
  @@users['superadmin']['fullname'] = 'Spigit Administrator'
  @@users['superadmin']['email'] = 'webadmin@spigit.com'

  @@users['member1']['username'] = 'autobot1'
  @@users['member1']['password'] = 'Spigit.123'
  @@users['member1']['firstname'] = 'Autobot'
  @@users['member1']['lastname'] =  'One'
  @@users['member1']['fullname'] = 'Autobot One'
  @@users['member1']['email'] = 'qeautomation1@spigit.com'
  @@users['member1']['emailpsw'] = 'T!me12charpwd'
  @@users['member1']['nickname'] = 'NickOne'

  @@users['member2']['username'] = 'autobot2'
  @@users['member2']['password'] = 'Spigit.123'
  @@users['member2']['firstname'] = 'Autobot'
  @@users['member2']['lastname'] = 'Two'
  @@users['member2']['fullname'] = 'Autobot Two'
  @@users['member2']['email'] = 'qeautomation2@spigit.com'
  @@users['member2']['emailpsw'] = 'T!me12charpwd'

  @@users['member3']['username'] = 'autobot3'
  @@users['member3']['password'] = 'Spigit.123'
  @@users['member3']['firstname'] = 'Autobot'
  @@users['member3']['lastname'] = 'Three'
  @@users['member3']['fullname'] = 'Autobot Three'
  @@users['member3']['email'] = 'qeautomation3@spigit.com'
  @@users['member3']['emailpsw'] = 'T!me12charpwd'

  @@users['member4']['username'] = 'autobot4'
  @@users['member4']['password'] = 'Spigit.123'
  @@users['member4']['firstname'] = 'Autobot'
  @@users['member4']['lastname'] = 'Four'
  @@users['member4']['fullname'] = 'Autobot Four'
  @@users['member4']['email'] = 'qeautomation4@spigit.com'
  @@users['member4']['emailpsw'] = 'T!me12charpwd'

  @@users['member6']['username'] = 'autobot6'
  @@users['member6']['password'] = 'Spigit.123'
  @@users['member6']['firstname'] = 'Autobot'
  @@users['member6']['lastname'] = 'Six'
  @@users['member6']['fullname'] = 'Autobot Six'
  @@users['member6']['email'] = 'qeautomation+user15@spigit.com'
  @@users['member6']['emailpsw'] = 'T!me12charpwd'
  @@users['member6']['locked'] = 'false'

  @@users['member7']['username'] = 'autobot7'
  @@users['member7']['password'] = 'Spigit.123'
  @@users['member7']['firstname'] = 'Autobot'
  @@users['member7']['lastname'] = 'Seven'
  @@users['member7']['fullname'] = 'Autobot Seven'
  @@users['member7']['email'] = 'qeautomation+user16@spigit.com'
  @@users['member7']['emailpsw'] = 'T!me12charpwd'

  @@users['member8']['username'] = 'autobot8'
  @@users['member8']['password'] = 'Spigit.123'
  @@users['member8']['firstname'] = 'Autobot'
  @@users['member8']['lastname'] = 'Eight'
  @@users['member8']['fullname'] = 'Autobot Eight'
  @@users['member8']['email'] = 'qeautomation+user17@spigit.com'
  @@users['member8']['emailpsw'] = 'T!me12charpwd'

  @@users['admin1']['username'] = 'autobot5'
  @@users['admin1']['password'] = 'Spigit.123'
  @@users['admin1']['firstname'] = 'Administrator'
  @@users['admin1']['lastname'] = 'User'
  @@users['admin1']['fullname'] = 'Administrator User'
  @@users['admin1']['email'] = 'qeautomation+user7@spigit.com'
  @@users['admin1']['emailpsw'] = 'T!me12charpwd'

  @@users['memberX1']['username'] = 'autobotX1'
  @@users['memberX1']['password'] = 'Spigit.123'
  @@users['memberX1']['firstname'] = 'AutobotX'
  @@users['memberX1']['lastname'] = 'UserOne'
  @@users['memberX1']['email'] = 'qeautomation+user21@spigit.com'
  @@users['memberX1']['emailpsw'] = 'T!me12charpwd'

  @@users['memberX2']['username'] = 'autobotX2'
  @@users['memberX2']['password'] = 'Spigit.123'
  @@users['memberX2']['firstname'] = 'AutobotX'
  @@users['memberX2']['lastname'] = 'UserTwo'
  @@users['memberX2']['email'] = 'qeautomation+user22@spigit.com'
  @@users['memberX2']['emailpsw'] = 'T!me12charpwd'

  @@users['memberX3']['username'] = 'autobotX3'
  @@users['memberX3']['password'] = 'Spigit.123'
  @@users['memberX3']['firstname'] = 'AutobotX'
  @@users['memberX3']['lastname'] = 'UserThree'
  @@users['memberX3']['email'] = 'qeautomation+user23@spigit.com'
  @@users['memberX3']['emailpsw'] = 'T!me12charpwd'

  @@users['memberX4']['username'] = 'autobotX4'
  @@users['memberX4']['password'] = 'Spigit.123'
  @@users['memberX4']['firstname'] = 'AutobotX'
  @@users['memberX4']['lastname'] = 'UserFour'
  @@users['memberX4']['email'] = 'qeautomation+user24@spigit.com'
  @@users['memberX4']['emailpsw'] = 'T!me12charpwd'

  @@users['memberX5']['username'] = 'autobotX5'
  @@users['memberX5']['password'] = 'Spigit.123'

  @@users['search1']['username'] = 'topsearchuser'
  @@users['search1']['password'] = 'Spigit.123'
  @@users['search1']['email'] = 'test1@test.com'
  @@users['search1']['firstname'] = 'firstname'
  @@users['search1']['lastname'] = 'lastname'

  @@users['search2']['username'] = 'autobot10'
  @@users['search2']['password'] = 'Spigit.123'
  @@users['search2']['email'] = 'test2@test.com'
  @@users['search2']['firstname'] = 'topsearchfname'
  @@users['search2']['lastname'] = 'lastname'

  @@users['search3']['username'] = 'autobot11'
  @@users['search3']['password'] = 'Spigit.123'
  @@users['search3']['email'] = 'test3@test.com'
  @@users['search3']['firstname'] = 'firstname'
  @@users['search3']['lastname'] = 'topsearchlname'

  @@users['memberuser1']['username'] = 'autoUser1'
  @@users['memberuser1']['password'] = 'Spigit.123'
  @@users['memberuser1']['firstname'] = 'USUserOne'
  @@users['memberuser1']['lastname'] = 'US-TwoOne'
  @@users['memberuser1']['email'] = 'autoUserUS021@spigit.com'
  @@users['memberuser1']['emailpsw'] = 'Admin1234@'

  @@users['memberuser2']['username'] = 'autoUser2'
  @@users['memberuser2']['password'] = 'Spigit.123'
  @@users['memberuser2']['firstname'] = 'USUserTwo'
  @@users['memberuser2']['lastname'] = 'US-TwoTwo'
  @@users['memberuser2']['email'] = 'autoUserUS022@spigit.com'
  @@users['memberuser2']['emailpsw'] = 'Admin1234@'

  @@users['memberuser3']['username'] = 'autoUser3'
  @@users['memberuser3']['password'] = 'Spigit.123'
  @@users['memberuser3']['firstname'] = 'USUserThree'
  @@users['memberuser3']['lastname'] = 'US-TwoThree'
  @@users['memberuser3']['email'] = 'autoUserUS023@spigit.com'
  @@users['memberuser3']['emailpsw'] = 'Admin1234@'

  @@users['memberuser4']['username'] = 'au_to.bot-003'
  @@users['memberuser4']['password'] = 'Spigit.123'
  @@users['memberuser4']['firstname'] = 'SpecialChar'
  @@users['memberuser4']['lastname'] = 'User'
  @@users['memberuser4']['email'] = 'specialcharuser@spigit.com'
  @@users['memberuser4']['emailpsw'] = 'Admin1234@'

  @@users['tempuser1']['username'] = 'TempUser1'
  @@users['tempuser1']['password'] = 'Spigit.123'
  @@users['tempuser1']['firstname'] = 'TempUser'
  @@users['tempuser1']['lastname'] = 'One'
  @@users['tempuser1']['email'] = 'tempuser1@spigit.com'
  @@users['tempuser1']['emailpsw'] = 'Admin1234@'

  @@users['tempuser2']['username'] = 'TempUser2'
  @@users['tempuser2']['password'] = 'Spigit.123'
  @@users['tempuser2']['firstname'] = 'TempUser'
  @@users['tempuser2']['lastname'] = 'Two'
  @@users['tempuser2']['email'] = 'tempuser2@spigit.com'
  @@users['tempuser2']['emailpsw'] = 'Admin1234@'

  @@users['tempuser3']['username'] = 'TempUser3'
  @@users['tempuser3']['password'] = 'Spigit.123'
  @@users['tempuser3']['firstname'] = 'TempUser'
  @@users['tempuser3']['lastname'] = 'Three'
  @@users['tempuser3']['email'] = 'tempuser3@spigit.com'
  @@users['tempuser3']['emailpsw'] = 'Admin1234@'

  @@users['tempuser4']['username'] = 'TempUser4'
  @@users['tempuser4']['password'] = 'Spigit.123'
  @@users['tempuser4']['firstname'] = 'TempUser'
  @@users['tempuser4']['lastname'] = 'Four'
  @@users['tempuser4']['email'] = 'tempuser4@spigit.com'
  @@users['tempuser4']['emailpsw'] = 'Admin1234@'

  @@users['tempuser5']['username'] = 'TempUser5'
  @@users['tempuser5']['password'] = 'Spigit.123'
  @@users['tempuser5']['firstname'] = 'TempUser'
  @@users['tempuser5']['lastname'] = 'Five'
  @@users['tempuser5']['email'] = 'tempuser5@spigit.com'
  @@users['tempuser5']['emailpsw'] = 'Admin1234@'

  @@users['tempuser6']['username'] = 'TempUser6'
  @@users['tempuser6']['password'] = 'Spigit.123'
  @@users['tempuser6']['firstname'] = 'TempUser'
  @@users['tempuser6']['lastname'] = 'Six'
  @@users['tempuser6']['email'] = 'tempuser6@spigit.com'
  @@users['tempuser6']['emailpsw'] = 'Admin1234@'

  @@users['tempuser7']['username'] = 'TempUser7'
  @@users['tempuser7']['password'] = 'Spigit.123'
  @@users['tempuser7']['firstname'] = 'TempUser'
  @@users['tempuser7']['lastname'] = 'Seven'
  @@users['tempuser7']['email'] = 'tempuser7@spigit.com'
  @@users['tempuser7']['emailpsw'] = 'Admin1234@'

  @@users['tempuser8']['username'] = 'TempUser8'
  @@users['tempuser8']['password'] = 'Spigit.123'
  @@users['tempuser8']['firstname'] = 'TempUser'
  @@users['tempuser8']['lastname'] = 'Eight'
  @@users['tempuser8']['email'] = 'tempuser8@spigit.com'
  @@users['tempuser8']['emailpsw'] = 'Admin1234@'

  @@users['tempuser9']['username'] = 'TempUser9'
  @@users['tempuser9']['password'] = 'Spigit.123'
  @@users['tempuser9']['firstname'] = 'TempUser'
  @@users['tempuser9']['lastname'] = 'Nine'
  @@users['tempuser9']['email'] = 'tempuser9@spigit.com'
  @@users['tempuser9']['emailpsw'] = 'Admin1234@'

  @@users['tempuser10']['username'] = 'TempUser10'
  @@users['tempuser10']['password'] = 'Spigit.123'
  @@users['tempuser10']['firstname'] = 'TempUser'
  @@users['tempuser10']['lastname'] = 'Ten'
  @@users['tempuser10']['email'] = 'tempuser10@spigit.com'
  @@users['tempuser10']['emailpsw'] = 'Admin1234@'

  @@users['tempuser11']['username'] = 'TempUser11'
  @@users['tempuser11']['password'] = 'Spigit.123'
  @@users['tempuser11']['firstname'] = 'TempUser'
  @@users['tempuser11']['lastname'] = 'Eleven'
  @@users['tempuser11']['email'] = 'tempuser11@spigit.com'
  @@users['tempuser11']['emailpsw'] = 'Admin1234@'

  @@users['tempuser12']['username'] = 'TempUser12'
  @@users['tempuser12']['password'] = 'Spigit.123'
  @@users['tempuser12']['firstname'] = 'TempUser'
  @@users['tempuser12']['lastname'] = 'Twelve'
  @@users['tempuser12']['email'] = 'tempuser12@spigit.com'
  @@users['tempuser12']['emailpsw'] = 'Admin1234@'

  @@users['tempuser13']['username'] = 'TempUser13'
  @@users['tempuser13']['password'] = 'Spigit.123'
  @@users['tempuser13']['firstname'] = 'TempUser'
  @@users['tempuser13']['lastname'] = 'Thirteen'
  @@users['tempuser13']['email'] = 'tempuser13@spigit.com'
  @@users['tempuser13']['emailpsw'] = 'Admin1234@'

  @@users['tempuser14']['username'] = 'TempUser14'
  @@users['tempuser14']['password'] = 'Spigit.123'
  @@users['tempuser14']['firstname'] = 'TempUser'
  @@users['tempuser14']['lastname'] = 'Fourteen'
  @@users['tempuser14']['email'] = 'tempuser14@spigit.com'
  @@users['tempuser14']['emailpsw'] = 'Admin1234@'

  @@users['tempuser15']['username'] = 'TempUser15'
  @@users['tempuser15']['password'] = 'Spigit.123'
  @@users['tempuser15']['firstname'] = 'TempUser'
  @@users['tempuser15']['lastname'] = 'Fifteen'
  @@users['tempuser15']['email'] = 'tempuser15@spigit.com'
  @@users['tempuser15']['emailpsw'] = 'Admin1234@'

  @@users['tempuser16']['username'] = 'TempUser16'
  @@users['tempuser16']['password'] = 'Spigit.123'
  @@users['tempuser16']['firstname'] = 'TempUser'
  @@users['tempuser16']['lastname'] = 'Sixteen'
  @@users['tempuser16']['email'] = 'tempuser16@spigit.com'
  @@users['tempuser16']['emailpsw'] = 'Admin1234@'

  @@users['tempuser17']['username'] = 'TempUser17'
  @@users['tempuser17']['password'] = 'Spigit.123'
  @@users['tempuser17']['firstname'] = 'TempUser'
  @@users['tempuser17']['lastname'] = 'Seventeen'
  @@users['tempuser17']['email'] = 'tempuser17@spigit.com'
  @@users['tempuser17']['emailpsw'] = 'Admin1234@'

  @@users['tempuser18']['username'] = 'TempUser18'
  @@users['tempuser18']['password'] = 'Spigit.123'
  @@users['tempuser18']['firstname'] = 'TempUser'
  @@users['tempuser18']['lastname'] = 'Eighteen'
  @@users['tempuser18']['email'] = 'tempuser18@spigit.com'
  @@users['tempuser18']['emailpsw'] = 'Admin1234@'

  @@users['tempuser19']['username'] = 'TempUser19'
  @@users['tempuser19']['password'] = 'Spigit.123'
  @@users['tempuser19']['firstname'] = 'TempUser'
  @@users['tempuser19']['lastname'] = 'Nineteen'
  @@users['tempuser19']['email'] = 'tempuser19@spigit.com'
  @@users['tempuser19']['emailpsw'] = 'Admin1234@'

  @@users['tempuser20']['username'] = 'TempUser20'
  @@users['tempuser20']['password'] = 'Spigit.123'
  @@users['tempuser20']['firstname'] = 'TempUser'
  @@users['tempuser20']['lastname'] = 'Twenty'
  @@users['tempuser20']['email'] = 'tempuser20@spigit.com'
  @@users['tempuser20']['emailpsw'] = 'Admin1234@'

  @@users['tempuser21']['username'] = 'TempUser21'
  @@users['tempuser21']['password'] = 'Spigit.123'
  @@users['tempuser21']['firstname'] = 'TempUser'
  @@users['tempuser21']['lastname'] = 'Twenty One'
  @@users['tempuser21']['email'] = 'tempuser21@spigit.com'
  @@users['tempuser21']['emailpsw'] = 'Admin1234@'

  @@users['tempuser22']['username'] = 'TempUser22'
  @@users['tempuser22']['password'] = 'Spigit.123'
  @@users['tempuser22']['firstname'] = 'TempUser'
  @@users['tempuser22']['lastname'] = 'Twenty Two'
  @@users['tempuser22']['email'] = 'tempuser22@spigit.com'
  @@users['tempuser22']['emailpsw'] = 'Admin1234@'

  @@users['tempuser23']['username'] = 'TempUser23'
  @@users['tempuser23']['password'] = 'Spigit.123'
  @@users['tempuser23']['firstname'] = 'TempUser'
  @@users['tempuser23']['lastname'] = 'Twenty Three'
  @@users['tempuser23']['email'] = 'tempuser23@spigit.com'
  @@users['tempuser23']['emailpsw'] = 'Admin1234@'

  @@users['tempuser24']['username'] = 'TempUser24'
  @@users['tempuser24']['password'] = 'Spigit.123'
  @@users['tempuser24']['firstname'] = 'TempUser'
  @@users['tempuser24']['lastname'] = 'Twenty Four'
  @@users['tempuser24']['email'] = 'tempuser24@spigit.com'
  @@users['tempuser24']['emailpsw'] = 'Admin1234@'

  @@users['tempuser25']['username'] = 'TempUser25'
  @@users['tempuser25']['password'] = 'Spigit.123'
  @@users['tempuser25']['firstname'] = 'TempUser'
  @@users['tempuser25']['lastname'] = 'Twenty Five'
  @@users['tempuser25']['email'] = 'tempuser25@spigit.com'
  @@users['tempuser25']['emailpsw'] = 'Admin1234@'

  @@users['tempuser26']['username'] = 'TempUser26'
  @@users['tempuser26']['password'] = 'Spigit.123'
  @@users['tempuser26']['firstname'] = 'TempUser'
  @@users['tempuser26']['lastname'] = 'Twenty Six'
  @@users['tempuser26']['email'] = 'tempuser26@spigit.com'
  @@users['tempuser26']['emailpsw'] = 'Admin1234@'

  @@users['tempuser27']['username'] = 'TempUser27'
  @@users['tempuser27']['password'] = 'Spigit.123'
  @@users['tempuser27']['firstname'] = 'TempUser'
  @@users['tempuser27']['lastname'] = 'Twenty Seven'
  @@users['tempuser27']['email'] = 'tempuser27@spigit.com'
  @@users['tempuser27']['emailpsw'] = 'Admin1234@'

  @@users['tempuser28']['username'] = 'TempUser28'
  @@users['tempuser28']['password'] = 'Spigit.123'
  @@users['tempuser28']['firstname'] = 'TempUser'
  @@users['tempuser28']['lastname'] = 'Twenty Eight'
  @@users['tempuser28']['email'] = 'tempuser28@spigit.com'
  @@users['tempuser28']['emailpsw'] = 'Admin1234@'

  @@users['tempuser29']['username'] = 'TempUser29'
  @@users['tempuser29']['password'] = 'Spigit.123'
  @@users['tempuser29']['firstname'] = 'TempUser'
  @@users['tempuser29']['lastname'] = 'Twenty Nine'
  @@users['tempuser29']['email'] = 'tempuser29@spigit.com'
  @@users['tempuser29']['emailpsw'] = 'Admin1234@'

  @@users['tempuser30']['username'] = 'TempUser30'
  @@users['tempuser30']['password'] = 'Spigit.123'
  @@users['tempuser30']['firstname'] = 'TempUser'
  @@users['tempuser30']['lastname'] = 'Thirty'
  @@users['tempuser30']['email'] = 'tempuser30@spigit.com'
  @@users['tempuser30']['emailpsw'] = 'Admin1234@'

  @@users['tempuser31']['username'] = 'TempUser31'
  @@users['tempuser31']['password'] = 'Spigit.123'
  @@users['tempuser31']['firstname'] = 'TempUser'
  @@users['tempuser31']['lastname'] = 'Thirty One'
  @@users['tempuser31']['email'] = 'tempuser31@spigit.com'
  @@users['tempuser31']['emailpsw'] = 'Admin1234@'

  @@users['tempuser32']['username'] = 'TempUser32'
  @@users['tempuser32']['password'] = 'Spigit.123'
  @@users['tempuser32']['firstname'] = 'TempUser'
  @@users['tempuser32']['lastname'] = 'Thirty Two'
  @@users['tempuser32']['email'] = 'tempuser32@spigit.com'
  @@users['tempuser32']['emailpsw'] = 'Admin1234@'

  @@users['tempuser33']['username'] = 'TempUser33'
  @@users['tempuser33']['password'] = 'Spigit.123'
  @@users['tempuser33']['firstname'] = 'TempUser'
  @@users['tempuser33']['lastname'] = 'Thirty Three'
  @@users['tempuser33']['email'] = 'tempuser33@spigit.com'
  @@users['tempuser33']['emailpsw'] = 'Admin1234@'

  @@users['tempuser34']['username'] = 'TempUser34'
  @@users['tempuser34']['password'] = 'Spigit.123'
  @@users['tempuser34']['firstname'] = 'TempUser'
  @@users['tempuser34']['lastname'] = 'Thirty Four'
  @@users['tempuser34']['email'] = 'tempuser34@spigit.com'
  @@users['tempuser34']['emailpsw'] = 'Admin1234@'

  @@users['tempuser35']['username'] = 'TempUser35'
  @@users['tempuser35']['password'] = 'Spigit.123'
  @@users['tempuser35']['firstname'] = 'TempUser'
  @@users['tempuser35']['lastname'] = 'Thirty Five'
  @@users['tempuser35']['email'] = 'tempuser35@spigit.com'
  @@users['tempuser35']['emailpsw'] = 'Admin1234@'

  @@users['tempuser36']['username'] = 'TempUser36'
  @@users['tempuser36']['password'] = 'Spigit.123'
  @@users['tempuser36']['firstname'] = 'TempUser'
  @@users['tempuser36']['lastname'] = 'Thirty Six'
  @@users['tempuser36']['email'] = 'tempuser36@spigit.com'
  @@users['tempuser36']['emailpsw'] = 'Admin1234@'

  @@users['tempuser37']['username'] = 'TempUser37'
  @@users['tempuser37']['password'] = 'Spigit.123'
  @@users['tempuser37']['firstname'] = 'TempUser'
  @@users['tempuser37']['lastname'] = 'Thirty Seven'
  @@users['tempuser37']['email'] = 'tempuser37@spigit.com'
  @@users['tempuser37']['emailpsw'] = 'Admin1234@'

  @@users['tempuser38']['username'] = 'TempUser38'
  @@users['tempuser38']['password'] = 'Spigit.123'
  @@users['tempuser38']['firstname'] = 'TempUser'
  @@users['tempuser38']['lastname'] = 'Thirty Eight'
  @@users['tempuser38']['email'] = 'tempuser38@spigit.com'
  @@users['tempuser38']['emailpsw'] = 'Admin1234@'

  @@users['tempuser39']['username'] = 'TempUser39'
  @@users['tempuser39']['password'] = 'Spigit.123'
  @@users['tempuser39']['firstname'] = 'TempUser'
  @@users['tempuser39']['lastname'] = 'Thirty Nine'
  @@users['tempuser39']['email'] = 'tempuser39@spigit.com'
  @@users['tempuser39']['emailpsw'] = 'Admin1234@'

  @@users['tempuser40']['username'] = 'TempUser40'
  @@users['tempuser40']['password'] = 'Spigit.123'
  @@users['tempuser40']['firstname'] = 'TempUser'
  @@users['tempuser40']['lastname'] = 'Forty'
  @@users['tempuser40']['email'] = 'tempuser40@spigit.com'
  @@users['tempuser40']['emailpsw'] = 'Admin1234@'


  def getUser(user, info)
    @@users[user][info]
  end

  def addUser(user, info, value)
    @@users[user][info] = value
  end

  def getUserReference(data, value)
    @@users.find{|key, h| h[data] == value }[0]
  end

  def getSession(useraccount, password)

    session = @@users[useraccount]['session']
    if session.nil?
      puts 'There was no active session.'
      @@users[useraccount]['session'] = Gmail.new(useraccount, password)
      return @@users[useraccount]['session']
    else
      unless session.logged_in?
        puts 'Session has been expired.'
        @@users[useraccount]['session'] = Gmail.new(useraccount, password)
        return @@users[user]['session']
      else
        puts 'Session still active.'
        return @@users[useraccount]['session']
      end
    end
  end

end