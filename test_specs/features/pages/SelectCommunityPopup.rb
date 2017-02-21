class SelectCommunityPopup < SitePrism::Page

  element :popup_container, '.ui-dialog.ui-widget-content'
  element :keywords_field, '#keywords'
  element :search_button, '#comm_pick>button'
  element :close_button, :xpath, ".//*[@class='ui-dialog-buttonset']/button[text()='Close']"
  element :search_form, '#comm_pick'

  def closePopup
    within popup_container do
      close_button.click
    end
  end

  ##
  # @param [String] title   Title of the community to select
  #
  def selectCommunity(title)
    within popup_container do
      if has_search_form?
        keywords_field.set title
        search_button.click
      end
      first(:xpath, ".//ul/li[contains(.,'#{title}')]").click
    end
  end

end