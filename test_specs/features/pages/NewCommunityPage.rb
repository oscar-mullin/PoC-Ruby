class LoginPage < SitePrism::Page

  element :site_url_field, :xpath, ".//input[@id='url_field']"
  element :parent_none_radiobutton, :xpath, ".//input[@id='child_none']"
  element :parent_comm_radiobutton, :xpath, ".//input[@id='child_comm']"
  element :select_parent_comm_link, :xpath, ".//a[@id='child_select_comm']"

  element :theme_none_radiobutton, :xpath, ".//input[@id='theme_none']"
  element :theme_comm_radiobutton, :xpath, ".//input[@id='theme_comm']"
  element :select_comm_theme_link, :xpath, ".//a[@id='theme_select_comm']"

  element :siteconfig_none_radiobutton, :xpath, ""
  element :siteconfig_template_radiobutton, :xpath, ""
  element :select_template_siteconfig_link, :xpath, ""
  element :siteconfig_comm_radiobutton, :xpath, ""
  element :select_comm_siteconfig_link, :xpath, ""

  element :comm_access_dropdown, :xpath, ".//span[@id='comm_access')]"
  element :comm_title_field, :xpath, ".//input[@id='comm_title']"
  element :comm_desc_textarea, :xpath, ".//textarea[@id='comm_desc']"
  element :comm_tags_field, :xpath, ".//input[@id='comm_tags']"

  element :save_template_yes_radio_button, :xpath, ".//input[@id='save_temp_yes']"
  element :save_template_no_radio_button, :xpath, ".//input[@id='save_temp_no']"
  element :template_title_field, :xpath, ".//input[@id='temp_title']"
  element :template_desc_textarea, :xpath, ".//textarea[@id='temp_desc']"

  element :submit_button, :xpath, ".//*[text()='Submit' or text()='submit' or text()='SUBMIT']"
  element :site_in_use_error_label, :xpath, ".//*[text()='Name in use, please enter another']"

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
    comm_desc_textarea.set comm_description
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
    save_template_yes_radio_button.click
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
      save_template_no_radio_button.click
    end
    submit_button.click
    return HomePage.new('','',0)
  end

end