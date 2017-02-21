class CreateCommunityPage < SitePrism::Page

  element :site_url_field, '#subdomain'
  element :message_container, '.error.inline'

  element :make_child_of_container, :xpath, ".//tr[contains(.,'Make child of')]/td[contains(@class,'community-group')]"
  element :parent_none_radiobutton, '#parentNone'
  element :parent_comm_radiobutton, '#parentThis'
  element :select_parent_comm_link, '#parentThis ~ div.community-picker>a'

  element :inherit_theme_from_container, :xpath, ".//tr[contains(.,'Inherit Theme from')]/td[contains(@class,'community-group')]"
  element :theme_none_radiobutton, '#defaultVisualTheme'
  element :theme_comm_radiobutton, '#templateVisualTheme'
  element :select_comm_theme_link, '#templateVisualTheme ~ div.community-picker>a'

  element :inherit_siteconfig_from_container, :xpath, ".//tr[contains(.,'Inherit Site Configuration from')]/td[contains(@class,'community-group')]"
  element :siteconfig_none_radiobutton, '#newComm'
  element :siteconfig_template_radiobutton, '#tempComm'
  element :select_template_siteconfig_link, '#tempComm ~ div.community-picker>a'
  element :siteconfig_comm_radiobutton, '#existComm'
  element :select_comm_siteconfig_link, '#existComm ~ div.community-picker>a'

  element :comm_access_dropdown, '#siteaccess'
  element :comm_title_field, '#pagetitle'
  element :comm_desc_field, '#pagedesc'
  element :comm_tags_field, '#pagekeywords'

  element :savetemplate_yes_radiobutton, '#templateYes'
  element :savetemplate_no_radiobutton, '#templateNo'
  element :template_title_field, '#templateTitle'
  element :template_desc_textarea, '#templateDescription'

  element :create_community_button, '#createCommunity'


  element :site_in_use_error_label, :xpath, ".//*[text()='Name in use, please enter another']"

  ##
  # @param [String] url   URL for the new community to be created
  #
  def fillUrlField(url)
    site_url_field.set url
  end

  def clickCreateCommunityButton
    create_community_button.click
  end

  def createCommunityButtonEnabled?
    return !create_community_button.disabled?
  end

  ##
  # @param [String] message   Message to verify
  #
  def verifyMessage(text)
    within message_container do
      return has_text?(text)
    end
  end

  ##
  # @param [String] option    None, or Existing Community
  #
  def selectParentCommunityOption(option)
    within make_child_of_container do
      choose(option)
    end
  end

  ##
  # @param [String] option    None (default theme), or Existing Community
  #
  def selectInheritThemeFromOption(option)
    within inherit_theme_from_container do
      choose(option)
    end
  end

  ##
  # @param [String] option    None (default configuration), Template Community, or Existing Community
  #
  def selectInheritSiteConfigFromOption(option)
    within inherit_siteconfig_from_container do
      choose(option)
    end
  end

  ##
  # @param [String] value   Community title
  #
  def fillCommunityTitleField(value)
    comm_title_field.set value
  end

  ##
  # @param [String] value   Community description
  #
  def fillCommunityDescriptionField(value)
    comm_desc_field.set value
  end

  ##
  # @param [String] value   Community tags
  #
  def fillCommunityTagsField(value)
    comm_tags_field.set value
  end

  ##
  # @param [String] url               URL for the new community to be created
  # @param [String] comm_access       Type of access: 'Private - Members Only', 'Private - Required Login', 'Public', 'Private - User Attribute'
  # @param [String] comm_title        Title for the new community to be created
  # @param [String] comm_description  Description for the new community to be created
  # @param [String] comm_tags         Tags for the community to be created, more than one tag can be received separate by comma (e.g.'tag1,tag2,tag3')
  #
  def setCommunityDetails(url, comm_access, comm_title, comm_description, comm_tags)
    site_url_field.set url
    comm_access_dropdown.click
    comm_access_dropdown.find(:xpath, ".//option[text()='#{comm_access}']").click
    comm_title_field.set comm_title
    comm_desc_field.set comm_description
    comm_tags_field.set comm_tags
  end

  ##
  # @param [String] parent_comm   Parent community title, or 'none'
  #
  def setParentCommunity(parent_comm)
    if parent_comm == 'none'
      parent_none_radiobutton.click
    else
      parent_comm_radiobutton.click
      select_parent_comm_link.click
      searchCommunityPopup = SearchCommunityPopup.new('','',0)
      searchCommunityPopup.selectCommunity(parent_comm)
    end
  end

  ##
  # @param [String] comm_theme    Community title to inherit theme from, or 'none'
  #
  def setCommunityToInheritThemeFrom(comm_theme)
    if comm_theme == 'none'
      theme_none_radiobutton.click
    else
      theme_comm_radiobutton.click
      select_comm_theme_link.click
      searchCommunityPopup = SearchCommunityPopup.new('','',0)
      searchCommunityPopup.selectCommunity(comm_theme)
    end
  end

  ##
  # @param [String] comm_config   Community title/template name to inherit site configuration from, or 'none'
  #
  def setCommunityToInheritConfigFrom(comm_config)
    if comm_config == 'none'
      siteconfig_none_radiobutton.click
    elsif comm_config.include?('Template')
      siteconfig_template_radiobutton.click
      select_template_siteconfig_link.click
      searchCommunityPopup = SearchCommunityPopup.new('','',0)
      searchCommunityPopup.selectCommunity(comm_config)
    else
      siteconfig_comm_radiobutton.click
      select_comm_siteconfig_link.click
      searchCommunityPopup = SearchCommunityPopup.new('','',0)
      searchCommunityPopup.selectCommunity(comm_config)
    end
  end

  ##
  # @param [String] temp_title        Title for the new community to be created
  # @param [String] temp_description  Description for the new community to be created
  #
  def setTemplateDetails(temp_title, temp_description)
    savetemplate_yes_radiobutton.click
    template_title_field.set temp_title
    template_desc_textarea.set temp_description
  end

  ##
  # Method to create a community and save it as template if it is required
  # @param [String] url           URL for the new community to be created
  # @param [String] comm_access   Type of access: 'Private - Members Only', 'Private - Required Login', 'Public', 'Private - User Attribute'
  # @param [String] comm_title    Title for the new community to be created
  # @param [String] comm_desc     Description for the new community to be created
  # @param [String] comm_tags     Tags for the community to be created, more than one tag can be received separate by comma (e.g.'tag1,tag2,tag3')
  # @param [String] parent_comm   Parent community title, or 'none'
  # @param [String] comm_theme    Community title to inherit theme from, or 'none'
  # @param [String] comm_config   Community title/template name to inherit site configuration from, or 'none'
  # @param [String] save_template 'Yes' or 'No'
  # @param [String] temp_title        Title for the new community to be created
  # @param [String] temp_description  Description for the new community to be created
  #
  def createCommunity(url, comm_access, comm_title, comm_description, comm_tags, parent_comm, comm_theme, comm_config, save_template, temp_title, temp_description)
    setCommunityDetails(url, comm_access, comm_title, comm_description, comm_tags)
    setParentCommunity(parent_comm)
    setCommunityToInheritThemeFrom(comm_theme)
    setCommunityToInheritConfigFrom(comm_config)
    if save_template == 'yes'
      setTemplateDetails(temp_title, temp_description)
    else
      savetemplate_no_radiobutton.click
    end
    create_community_button.click
    return HomePage.new('','',0)
  end

end