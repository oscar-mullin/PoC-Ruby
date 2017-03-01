class AdministrationPage < SitePrism::Page

  element :theme_editor_link, :xpath, ".//a[@href='/Page/Theme']"
  element :create_community_link, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FPage%2FCreateCommunity']"
  element :site_themes_access_settings_link, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FSiteSettings%3Fpagename%3Dsitesettings']"
  element :manage_community_link, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FManageSitePage']"
  element :idea_template_editor_link, :xpath, ".//a[@href='/Admin/IdeaTemplateEditor']"
  element :permissions_link, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FPermissions%3Fpagename%3Dpermissions']"
  element :idea_management_link, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FAdmin%2FConfiguration%3Fsection%3DideaManagement']"
  element :users_link, :xpath, ".//a[@href='/Admin/Dashboard?orig_url=%2FPage%2FUserAdmin']"

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

  def clickManageCommunityLink
    manage_community_link.click
    return ManageCommunityPage.new('.communitytable tr','css',5)
  end

  def clickIdeaTemplateEditorLink
    idea_template_editor_link.click
    return IdeaTemplateEditorPage.new('#frmb-0-save>button','css',5)
  end

  def clickPermissionsLink
    permissions_link.click
    return PermissionsPage.new('.btn-primary','css',5)
  end

  def clickIdeaManagementLink
    idea_management_link.click
    return IdeaManagementPage.new('#stagesAdminList>li','css',5)
  end

  def clickUsersLink
    users_link.click
    return UsersPage.new('#userList tr','css',5)
  end

end