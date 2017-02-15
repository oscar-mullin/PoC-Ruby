class HomePage < SitePrism::Page

  element :home_link, :xpath, ".//a[@href='/Page/Home']"
  element :administration_link, :xpath, ".//a[@href='/Page/Administration']"
  element :view_ideas_link, :xpath, ".//a[@href='/Page/ViewIdeas']"
  element :post_idea_link, :xpath, ".//a[@href='/Page/PostIdea']"
  element :navigation_bar_container, :xpath, '.navHolder.enhanced'

  def clickHomeLink
    home_link.click
    # TODO: Update once the new Home page is ready
    return HomePage.new('','',0)
  end

  def clickAdministrationLink
    administration_link.click
    return AdministrationPage.new('css','table.admin div.thumbnailsm',0)
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
end