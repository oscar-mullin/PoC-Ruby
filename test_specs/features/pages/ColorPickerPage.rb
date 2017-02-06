class ColorPickerPage < SitePrism::Page

  element :hex_color_field, :xpath, ""

  def getHexColorFieldValue
    hex_color_field.value
  end

  def fillHexColorField(color)
    hex_color_field.set color
  end

end