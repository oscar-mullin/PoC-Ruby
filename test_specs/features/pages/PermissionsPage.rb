class PermissionsPage < SitePrism::Page

  element :cat_thread_post_permissons_list, '#post_perm_nodetype3'
  element :cat_comment_post_permissons_list, '#post_perm_nodetype16'


  def catThreadPostPermissionsOptionSelected?(option)
    within cat_thread_post_permissons_list do
      return find(:xpath, ".//option[contains(text(),'#{option}')]").selected?
    end
  end

  def catCommentPostPermissionsOptionSelected?(option)
    within cat_comment_post_permissons_list do
      return find(:xpath, ".//option[contains(text(),'#{option}')]").selected?
    end
  end

end