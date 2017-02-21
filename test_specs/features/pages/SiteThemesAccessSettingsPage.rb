class SiteThemesAccessSettingsPage < SitePrism::Page

  element :comm_title_field, '#pagetitle'
  element :comm_description_field, '#pagedesc'
  element :comm_tags_field, '#pagekeywords'

  def getCommunityTitle
    comm_title_field.value
  end

  def getCommunityDescription
    comm_description_field.value
  end

  def getCommunityTags
    comm_tags_field.value
  end

end