class UsersPage < SitePrism::Page

  element :search_users_field, '#keywords'
  element :search_button, '.simpleSearchBtn'
  element :user_list_container, '#userList'
  element :total_count_label, '.totalCount'

  def searchUser(username)
    search_users_field.set username
    search_button.click
    within user_list_container do
      users_count = total_count_label.text
      Util.elementDisplayedOnTime?('text', users_count, 5, false)
    end
  end

  def userHasRole?(username,role)
    searchUser(username)
    within user_list_container do
      has_xpath?(".//tr[.//a[text()='#{username}'] and td[text()='#{role}']]")
    end
  end

end