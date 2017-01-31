class DriverManager < SitePrism::Page

  def getCommunity (url)
    self.class.set_url url
    page.driver.browser.manage.window.maximize
    self.load
  end


end