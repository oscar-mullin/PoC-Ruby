class IdeaManagementPage < SitePrism::Page

  element :owner_can_delete_idea_checkbox, :xpath, ".//input[@id='config-single-com.spigit.idea.IdeaConfig.ownersCanDelete']"

  def ownerCanDeleteIdeaEnabled?
    return owner_can_delete_idea_checkbox.checked?
  end

end