class SearchCommunityPopup < SitePrism::Page

  element :popup_container, :xpath, ""
  element :keywords_field, :xpath, ""
  element :search_button, :xpath, ""
  element :cancel_button, :xpath, ""

  def closePopup
    within popup_container do
      cancelButton.click
    end
  end

  ##
  # @param [String] title   Title of the community to select
  #
  def selectCommunity(title)
    within popup_container do
      keywords_field.set title
      search_button.click
      first(:xpath, ".//ul/li[contains(text(),'#{title}')]").click
    end
  end

end