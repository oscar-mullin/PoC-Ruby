class ColorPickerPage < SitePrism::Page

  element :hex_color_field, :xpath, ""

  def getHexColorFieldValue
    hex_color_field.value
  end

  ##
  # @param [String] color   Color's hex code
  #
  def fillHexColorField(color)
    hex_color_field.set color
  end

end