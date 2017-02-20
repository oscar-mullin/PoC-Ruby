class AdministrationPage < SitePrism::Page

  element :theme_editor_link, :xpath, ".//a[@href='/Page/Theme']"
  element :create_community_link, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FPage%2FCreateCommunity']"
  element :site_themes_access_settings_link, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FSiteSettings%3Fpagename%3Dsitesettings']"

  def clickThemeEditorLink
    theme_editor_link.click
    return ThemeEditorPage.new('#theme-settings .form-section','css',3)
  end

  def clickCreateCommunityLink
    create_community_link.click
    return CreateCommunityPage.new('#createCommunityForm #createCommunity','css',5)
  end

  def clickSiteThemesAccessSettingsLink
    site_themes_access_settings_link.click
    return SiteThemesAccessSettingsPage.new('#SiteSettingsTable tr','css',5)
  end

end