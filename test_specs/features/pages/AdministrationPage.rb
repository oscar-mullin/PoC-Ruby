class AdministrationPage < SitePrism::Page

  element :theme_editor_link, :xpath, ".//a[@href='/Page/Theme']"

  def clickThemeEditorLink
    theme_editor_link.click
    return ThemeEditorPage.new('#theme-settings .form-section','css',3)
  end

end