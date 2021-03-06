class HomePage < SitePrism::Page

  element :home_link, :xpath, ".//a[@href='/Page/Home']"
  element :administration_link, :xpath, ".//a[@href='/Page/Administration']"
  element :view_ideas_link, :xpath, ".//a[@href='/Page/ViewIdeas']"
  element :post_idea_link, :xpath, ".//a[@href='/Page/PostIdea']"
  element :post_idea_link, :xpath, ".//a[@href='/Page/PostIdea']"
  element :innovation_market_link, ".//a[@href='/Page/InnovationMarket']"


  def clickHomeLink
    home_link.click
    # TODO: Update once the new Home page is ready
    return HomePage.new('','',0)
  end

  def clickAdministrationLink
    administration_link.click
    return AdministrationPage.new('table.admin div.thumbnailsm','css',5)
  end

  def clickViewIdeasLink
    clickViewIdeasLink.click
    # TODO: Update once the new View Ideas page is ready
    return ViewIdeasPage.new('','',0)
  end

  def clickPostIdeaLink
    post_idea_link.click
    # TODO: Update once the new Post Idea page is ready
    return PostIdeaPage.new('','',0)
  end

  ##
  # @param [String] property   Css property
  #
  def getNavigationBarContainerStyle(property)
    return navigation_bar_container.native.style(property).to_s
  end

  ##
  # @param [String] property   Css property
  #
  def getNavigationBarLinkStyle(property)
    return navigation_bar_container.find('li>a', :match => :first).native.style(property).to_s
  end

  def hoverViewIdeasLink
    view_ideas_link.hover
  end

  def clickInnovationMarketLink
    innovation_market_link.click
    return InnovationMarketPage.new('.communitylist>tbody>tr','csss',3)
  end
end