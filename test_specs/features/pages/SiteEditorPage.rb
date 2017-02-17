class SiteEditorPage < SitePrism::Page

  element :backtoportal_link, :xpath, ""
  element :showpagedetails_link, :xpath, ""

  element :page_dropdown, :xpath, ""
  element :editsplash_widget_element, :xpath, ""
  element :challenges_widget_element, :xpath, ""
  element :trending_widget_element, :xpath, ""
  element :myideas_widget_element, :xpath, ""
  element :activity_widget_element, :xpath, ""
  element :carousel_widget_element, :xpath, ""
  element :video_widget_element, :xpath, ""
  element :splash_widget_element, :xpath, ""
  element :tabgroup_widget_element, :xpath, ""
  element :target_panel, :xpath, ""

  element :save_button, :xpath, ""

  def dragAndDropWidget(widget_name)
    @xoffset = 0

    if $browser == 'IE'
      @yoffset = -50
    elsif $browser == 'FF'
      @yoffset = 0
    else
      @yoffset = 50
    end

    if Utils.elementDisplayedOnTime?('xpath'," #{widget_name} ", 1, true) then
      @elementsource = find(:xpath, "#{widget_name}")
      dragDropElement(@elementsource, @xoffset, @yoffset, @targetelement)
      selenium_webdriver = page.driver.browser
      selenium_webdriver.action.click_and_hold(@elementsource.native).move_to(@targetelement.native, @xoffset, @yoffset).release(@targetelement.native).perform
      if Utils.elementDisplayedOnTime?('xpath'," #{widget_name} ", 1, true) then
        save_button.click
      else
        fail(ArgumentError.new("Widget #{widget_name} was not added."))
      end
    else
      fail(ArgumentError.new("Widget #{widget_name} doesn't exist."))
    end
  end

  def deleteWidget(widget_name)
    unless widget_name==""
      if Utils.elementDisplayedOnTime?('xpath'," #{widget_name} ", 1, true) then
        find(:xpath, "#{widget_name}").click
        if Utils.elementDisplayedOnTime?('xpath'," #{widget_name} ", 1, false) then
          save_button.click
        else
          fail(ArgumentError.new("Widget #{widget_name} was not deleted."))
        end
      else
        fail(ArgumentError.new("Widget #{widget_name} doesn't exist."))
      end
    end
  end

  def setWidgetPermissions(widget_name,roles_list)

    rolesArr = roles_list.split(",")

    if Utils.elementDisplayedOnTime?('xpath'," #{widget_name} ", 1, true) then
      find(:xpath, "#{widget_name}").click

      rolesArr.each do |role|
        find(:xpath, "#{widget_name} #{role}").click
      end
    end
  end

end