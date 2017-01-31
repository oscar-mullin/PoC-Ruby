class SiteUtil < SitePrism::Page
  def getCurrentSite
    @@currentSite
  end

  def setCurrentSite(site)
    @@currentSite = site
  end

end