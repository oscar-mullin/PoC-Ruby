class AdministrationPage < SitePrism::Page

  element :theme_editor_link, :xpath, ".//a[@href='/Page/Theme']"

  def clickThemeEditorLink
    theme_editor_link.click
    return ThemeEditorPage.new('css','#theme-settings .form-section',0)
  end

end