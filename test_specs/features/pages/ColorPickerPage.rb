class ColorPickerPage < SitePrism::Page

  element :hex_color_field, '.colorpicker_hex>input'
  element :color_picker_container, '.colorpicker'
  element :ok_button, :xpath, ".//div[starts-with(@class,'colorpicker_submit')]"

  def getHexColorFieldValue
    within color_picker_container do
      hex_color_field.value
    end
  end

  ##
  # @param [String] color   Color's hex code
  #
  def fillHexColorField(color)
    within color_picker_container do
      hex_color_field.set color
    end
  end

  def clickOKButton
    ok_button.click
  end

end