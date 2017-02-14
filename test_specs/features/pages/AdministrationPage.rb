class AdministrationPage < SitePrism::Page

  element :theme_editor_link, :xpath, ""

  def clickThemeEditorLink
    theme_editor_link.click
    return ThemeEditorPage.new('','',0)
  end

end