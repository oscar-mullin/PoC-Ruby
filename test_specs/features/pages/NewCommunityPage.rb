class LoginPage < SitePrism::Page

  element :site_url_field, :xpath, ".//input[@id='url_field']"
  element :child_of_none_radio_button, :xpath, ".//input[@id='child_none']"
  element :child_of_comm_radio_button, :xpath, ".//input[@id='child_comm']"
  element :child_of_comm_select_parent_link, :xpath, ".//a[@id='child_select_comm']"
  element :select_comm_parent_popup, :xpath, ".//div[@id='select_comm_parent_panel']"
  element :theme_from_none_radio_button, :xpath, ".//input[@id='theme_none']"
  element :theme_from_comm_radio_button, :xpath, ".//input[@id='theme_comm']"
  element :select_theme_parent_popup, :xpath, ".//div[@id='select_theme_parent_panel']"
  element :theme_from_comm_select_parent_link, :xpath, ".//a[@id='theme_select_comm']"
  element :config_from_none_radio_button, :xpath, ".//input[@id='config_none']"
  element :config_from_template_radio_button, :xpath, ".//input[@id='config_template']"
  element :select_template_parent_popup, :xpath, ".//div[@id='select_temp_parent_panel']"
  element :config_from_comm_radio_button, :xpath, ".//input[@id='config_comm']"
  element :select_config_parent_popup, :xpath, ".//div[@id='select_config_parent_panel']"
  element :config_from_comm_select_parent_link, :xpath, ".//a[@id='config_select_comm']"
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

  # Method to create a community and save it as template if it is required
  # Parameters:
  # url               : URL for the new community to be created.
  # comm_title        : Title for the new community to be created.
  # comm_desc         : Description for the new community to be created.
  # comm_tags         : Tags for the community to be created, more than one tag can be received separate by comma (e.g.'tag1,tag2,tag3')
  # child_of          : Select parent community, it can be 'none' or title of any community.
  # theme_from        : Select theme from other community, it can be 'none' or title of any community.
  # config_from       : Select configuration from other community, it can be 'none' or title of other community or template.
  # comm_access       : Select the type of access, 'Private - Members Only', 'Private - Required Login', 'Public', 'Private - User Attribute'
  # save_as_template  : Select if the community to be created will be saved as template, options are 'Yes' or 'No'
  # temp_title        : Title for the new community template to be created.
  # temp_desc         : Description for the new community template to be created.
  def createCommunity(url,comm_title,comm_desc,comm_tags,child_of,theme_from,config_from,comm_access,save_as_template,temp_title,temp_desc)
    site_url_field.set url
    comm_title_field.set comm_title
    comm_desc_textarea.set comm_desc
    comm_tags_field.set comm_tags

    unless child_of == 'none'
      child_of_comm_radio_button.click
      child_of_comm_select_parent_link.click
      select_comm_parent_popup.find(:xpath, ".//span[text()='#{child_of}']").click
    else
      child_of_none_radio_button.click
    end

    unless theme_from == 'none'
      theme_from_comm_radio_button.click
      theme_from_comm_select_parent_link.click
      select_theme_parent_popup.find(:xpath, ".//span[text()='#{theme_from}']").click
    else
      theme_from_none_radio_button.click
    end

    if config_from == 'none'
      config_from_none_radio_button.click
    elsif config_from.include?('Template')
      config_from_template_radio_button.click
      config_from_comm_select_parent_link.click
      select_template_parent_popup.find(:xpath, ".//span[text()='#{config_from}']").click
    else
      config_from_comm_radio_button.click
      config_from_comm_select_parent_link.click
      select_config_parent_popup.find(:xpath, ".//span[text()='#{config_from}']").click
    end

    comm_access_dropdown.click
    comm_access_dropdown.find(:xpath, ".//option[text()='#{comm_access}']").click

    if save_as_template == 'yes'
      save_template_yes_radio_button.click
    template_title_field.set temp_title
    template_desc_textarea.set temp_desc
    else
      save_template_no_radio_button.click
    end

    submit_button.click
  end

end