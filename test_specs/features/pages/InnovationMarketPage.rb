class InnovationMarketPage < SitePrism::Page

  element :categories_list_container, '.communitylist'

  def categoryIsListed?(category)
    within categories_list_container do
      return has_text?(category)
    end
  end

end