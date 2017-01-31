class HomePage < SitePrism::Page

  element :homepage, :xpath, ".//body[@id='Home']"
  element :pagenotfound, :xpath, "//p/strong[text()='Page Not Found']"
  element :submit_button, :xpath, ".//a[@title='Submit']"
  element :editchallenge_link, :xpath, ".//a[contains(@href,'/Page/SiteChallengeAdminSettings/EditSiteChallenge') and not(@title)]"
  element :challengeEnded_label, :xpath, ".//div[contains(@class,'challenge_status_info')]/div[@class='status']/strong[text()='Challenge Ended']"
  element :winnersBanner, :xpath, ".//div[contains(@class,'challenge_winners') and @style='display: block;']"
  element :mostlikedideas_container, '#most_spigged_ideas'
  element :topideasstarrating_container, '#top_star_rated_ideas_fresh'
  element :topideaspulserate_container, '#site_challenge_top_ranked_ideas'
  element :topinnovators_container, '#site_challenge_top_innovators'
  element :selectwinnersnow_link, :xpath, ".//a[contains(@href,'/Page/SiteChallengeAdminSettings/SelectWinners')]"

  # region Top Navigation
  element :ldk_editor_link, :xpath, ".//div[@class='ldkEditToggle']"
  element :myprofile_link, :xpath, ".//a[@href='/Page/MyProfile' and @class='headerUserProfile']"
  element :myinbox_link, :xpath, './/a[@id="inboxMessage"]'
  element :help_menu_link, :xpath, ".//li[@class='help-info']/a"
  element :help_item_subscriptions_link, :xpath, ".//li[@class='help-info']/ul/li/a[@title='Subscriptions']"
  element :help_item_graph_api_link, :xpath, ".//li[@class='help-info']/ul/li/a[@title='Spigit Graph API']"
  element :help_item_admin_help_link, :xpath, ".//li[@class='help-info']/ul/li/a[@title='Administrator Help']"
  element :help_item_online_help_link, :xpath, ".//li[@class='help-info']/ul/li/a[@title='Online Help']"
  element :help_item_version_link, :xpath, ".//li[@class='help-info']/ul/li/a[@title='Product Version Information']"
  element :search_button, :xpath, ".//*[@id='searchform']//strong[@title='Search']"
  element :topsearch_field, '#query'
  # endregion

  # region Menu tabs
  element :home_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/Home']"
  element :activity_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/ActivityStream']"
  element :postidea_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/PostIdea']"
  element :postidea_button, :xpath, ".//div[@class='speuiSpriteButton']/a[@href='/Page/PostIdea']"
  element :viewideas_button, :xpath, ".//div[@class='speuiSpriteButton']/a[@href='/Page/ViewIdeas']"
  element :viewideas_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/ViewIdeas']"
  element :blogs_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/AllBlogs']"
  element :store_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/Store']"
  element :administration_link,:xpath, "(.//li[@role='menuitem']/a[@href='/Page/Administration'])[1]"
  element :leaderboard_link, :xpath, ".//div[@id='navWrap']//ul/li/a[@href='/Page/Leaderboard']"
  element :innovationmarket_link, :xpath, ".//div[@id='navWrap']//ul/li/a[@href='/Page/InnovationMarket']"
  element :challenges_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/SiteChallenges']"
  element :dashboard_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/Dashboard']"
  element :pairwise_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/Pairwise']"
  element :predictions_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/Predictions']"
  element :activitystream_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/ActivityStream']"
  element :communities_link, :xpath, ".//li[@role='menuitem']/a[@href='/Page/CommunitySearch']"
  element :communitiesattributes_link,:xpath, ".//li/a[@href='/Page/CommunityAttributes']"
  element :bulkactions_link, :xpath, ".//li/a[@href='/Page/IdeaList']"
  # endregion

  # region Version Information
  element :productversioninfo_container, :xpath, ".//td[h1[text()='Product Version Information']]" #'#panel298_1,#panel318_1,#panel316_1' #ENG-10423
  element :version_page_title_label, :xpath, ".//h1"
  element :version_page_build_host_label, :xpath, ".//ul/li[contains(text(),'BuildHost')]"
  element :version_page_branch_label, :xpath, ".//ul/li[contains(text(),'Branch')]"
  element :version_page_commit_label, :xpath, ".//ul/li[contains(text(),'Commit')]"
  element :version_page_build_user_label, :xpath, ".//ul/li[contains(text(),'BuildUser')]"
  # endregion

  # region Footer
  element :userguide_link, :xpath, ".//a[@title='User Guide']"
  element :support_link, :xpath, ".//a[@title='Support']"
  element :termsofservice_link, :xpath, ".//a[@title='Terms of Service']"
  element :constactus_link, :xpath, ".//a[@href='/aboutus']"
  element :ideaManagementSoftware_link, :xpath, ".//span[text()='Idea Management Software']"
  element :poweredbyspigit_link, :xpath, "//img[@src='/default/img/powered_by_spigit.png']"
  # endregion

  # region Sign In
  element :signin_link, :xpath, ".//div[@id='userNav']//a[@href='/User/Login' or text()='Sign In']"
  element :signout_link, :xpath, ".//a[@href='/User/Logout' and text()='Sign-Out']"
  element :register_link, :xpath, ".//div[@id='userNav']//a[@href='/User/Register']"
  # endregion

  #region Register
  element :firstnameregister_field, :xpath, "//input[@id='fname']"
  element :lastnameregister_field, :xpath, "//input[@id='lname']"
  element :usernameregister_field, :xpath, "//input[@id='username']"
  element :emailregister_field, :xpath, "//input[@id='email']"
  element :passwordregister_field, :xpath, "//input[@id='pw1']"
  element :passwordretyperegister_field, :xpath, "//input[@id='pw2']"
  element :invitationnumberregister_field, :xpath, "//input[@id='conf_num']"
  element :captchaanswerregister_field, :xpath, "//input[@id='spigit_captcha_answer']"
  element :termsandconditionregister_field, :xpath, "//input[@id='tnc']"
  #endregion

  def initialize()
    @util = Util.new
    pageDisplayed = @util.elementExistsOnTime("xpath", ".//body[@id='Home']", 10)
    if not(pageDisplayed) then
      fail(ArgumentError.new("Error when accessing to Home Page."))
    end
  end

end
