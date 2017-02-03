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

end
