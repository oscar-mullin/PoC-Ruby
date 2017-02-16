class AdministrationPage < SitePrism::Page

  element :theme_editor_link, :xpath, ".//a[@href='/Page/Theme']"

  def clickThemeEditorLink
    theme_editor_link.click
    return ThemeEditorPage.new(".//*[@id='contents']//h1[text()='Theme Editor']","xpath",0)
  end

end