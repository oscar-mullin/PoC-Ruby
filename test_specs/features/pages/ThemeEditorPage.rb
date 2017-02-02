class ThemeEditorPage < SitePrism::Page

  element :brand_color_button, :xpath, ""
  element :brand_color_hex_field, :xpath, ""
  element :button_text_color_button, :xpath, ""
  element :button_text_color_hex_field, :xpath, ""
  element :link_color_button, :xpath, ""
  element :link_color_hex_field, :xpath, ""
  element :navbar_text_color_button, :xpath, ""
  element :navbar_text_color_hex_field, :xpath, ""
  element :save_button, :xpath, ""
  element :save_all_communities_button, :xpath, ""
  element :message_container, :xpath, ""

  def clickBrandColorButton
    brand_color_button.click
  end

  def fillBrandColorHexField(color)
    brand_color_hex_field.set color
  end

  def changeBrandColor(color)
    clickBrandColorButton
    fillBrandColorHexField(color)
  end

  def clickButtonTextColorButton
    button_text_color_button.click
  end

  def fillButtonTextColorHexField(color)
    button_text_color_hex_field.set color
  end

  def changeButtonTextColorHexField(color)
    clickButtonTextColorButton
    fillButtonTextColorHexField(color)
  end

  def clickLinkColorButton
    link_color_button.click
  end

  def fillLinkColorHexField(color)
    fillLinkColorHexField.set color
  end

  def changeLinkColorHexField(color)
    clickLinkColorButton
    fillLinkColorHexField(color)
  end

  def clickNavbarTextColorButton
    navbar_text_color_button.click
  end

  def fillNavbarTextColorHexField(color)
    navbar_text_color_hex_field.fill color
  end

  def clickNavbarTextColorHexField(color)
    clickNavbarTextColorButton
    fillNavbarTextColorHexField(color)
  end

  def clickSaveButton
    save_button.click
  end

  def clickSaveAllCommunitiesButton
    save_all_communities_button.click
  end

  # To verify different messages
  def verifyMessage(text)
    within message_container do
      return has_text?(text)
    end
  end

  # path: image's absolute path
  def attachLogo(path)
    attach_file('logo', path)
  end

end