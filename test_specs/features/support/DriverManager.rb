class DriverManager < SitePrism::Page

  def loadUrl (url)
    self.class.set_url url
    self.load
    page.driver.browser.manage.window.maximize
  end

end