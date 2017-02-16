class ChallengesPage < SitePrism::Page

  elements :challengestitles_link, :xpath, ".//*[@id='siteChallengeViewPort']//div[@class='title']//div"

  def getTitleAttribute(attribute,challenge)
    case challenge
      when ''
        challengeTitle = challengestitles_link.first
        return challengeTitle[attribute].to_s
      else
        challengestitles_link.each do |challengeTitle|
          if challengeTitle.text == challenge
            return challengeTitle[attribute].to_s
            break
          end
        end
    end
  end

end