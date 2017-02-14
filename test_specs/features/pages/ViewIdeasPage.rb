class ViewIdeasPage < SitePrism::Page

  element :ideas_list_container, :xpath, ""

  def clickIdeaTitleLink(idea)
    within ideas_list_container do
      click_link(idea)
    end
    return IdeaDetailsPage.new('','',0)
  end

end