class ThemeEditorPage < SitePrism::Page

  element :brand_color_button, '.color-picker.color-brand.brand-bg'
  element :brand_color_preview, :xpath, ""
  element :button_text_color_button, :xpath, ""
  element :button_text_color_preview, :xpath, ""
  element :link_color_button, :xpath, ".//div[@class='color-picker-container']/div[@data-type='link']"
  element :link_color_preview, :xpath, ""
  element :navbar_text_color_button, '.color-picker.color-nav.nav-bg'
  element :navbar_text_color_preview, :xpath, ""
  element :link_change_logo, :xpath, ".//div[h3[contains(text(),'Logo')]]//input"

  element :save_button, '.submit-container>button.btn-primary'
  element :save_and_apply_button, :xpath, ""
  element :confirm_continue_link, :xpath, ""
  element :confirm_cancel_link, :xpath, ""
  element :message_container, '.popup-notice'

  def clickBrandColorButton
    brand_color_button.click
    return ColorPickerPage.new(".//div[contains(@id,'collorpicker')][contains(@style,'display: block')]",'xpath',1)
  end

  ##
  # @param [String] file_name   File name of the new logo image
  #
  def changeLogoImage(file_name)
     @utils.uploadFile(link_change_logo, file_name)
  end

  ##
  # @param [String] color   Color's hex code
  #
  def changeBrandColor(color)
    colorPickerPage = clickBrandColorButton
    colorPickerPage.fillHexColorField(color)
  end

  def clickButtonTextColorButton
    button_text_color_button.click
    return ColorPickerPage.new(".//div[contains(@id,'collorpicker')][contains(@style,'display: block')]",'xpath',1)
  end

  ##
  # @param [String] color   Color's hex code
  #
  def changeButtonTextColor(color)
    colorPickerPage = clickButtonTextColorButton
    colorPickerPage.fillHexColorField(color)
  end

  def clickLinkColorButton
    link_color_button.click
    return ColorPickerPage.new(".//div[contains(@id,'collorpicker')][contains(@style,'display: block')]",'xpath',1)
  end

  ##
  # @param [String] color   Color's hex code
  #
  def changeLinkColor(color)
    colorPickerPage = clickLinkColorButton
    colorPickerPage.fillHexColorField(color)
  end

  def clickNavbarTextColorButton
    navbar_text_color_button.click
    return ColorPickerPage.new(".//div[contains(@id,'collorpicker')][contains(@style,'display: block')]",'xpath',1)
  end

  ##
  # @param [String] color   Color's hex code
  #
  def changeNavbarTextColor(color)
    colorPickerPage = clickNavbarTextColorButton
    colorPickerPage.fillHexColorField(color)
  end

  def clickSaveButton
    save_button.click
  end

  def clickSaveAndApplyButton
    save_and_apply_button.click
  end

  def clickConfirmContinueLink
    confirm_continue_link.click
  end

  def clickCancelContinueLink
    confirm_cancel_link.click
  end

  ##
  # @param [String] text    Message to verify
  #
  def verifyMessage(text)
    within message_container do
      return has_text?(text)
    end
  end

  ##
  # @param [String] path    Image's absolute path
  #
  def attachLogo(path)
    attach_file('logo', path)
  end

  def saveButtonEnabled?
    return !save_button.disabled?
  end

end