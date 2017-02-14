class HomePage < SitePrism::Page

  element :home_link, :xpath, ""
  element :administration_link, :xpath, ""
  element :view_ideas_link, :xpath, ""
  element :post_idea_link, :xpath, ""
  element :navigation_bar_container, :xpath, '.navHolder.enhanced'

  def clickHomeLink
    home_link.click
    return HomePage.new('','',0)
  end

  def clickAdministrationLink
    administration_link.click
    return AdministrationPage.new('','',0)
  end

  def clickViewIdeasLink
    clickViewIdeasLink.click
    return ViewIdeasPage.new('','',0)
  end

  def clickPostIdeaLink
    post_idea_link.click
    return PostIdeaPage.new('','',0)
  end

  ##
  # @param [String] property   Css property
  #
  def getNavigationBarContainerStyle(property)
    return navigation_bar_container.native.style(property).to_s
  end

end