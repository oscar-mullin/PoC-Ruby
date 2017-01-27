class DriverManager < SitePrism::Page

  #element :stayonpage_link, :xpath, ".//div[@class='navigate-confirm-dialog']//a[text()='Stay on this page']"

  def getCommunity (url)
    self.class.set_url url
    page.driver.browser.manage.window.maximize
    self.load
  end


end