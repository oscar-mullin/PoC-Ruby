require 'site_prism/loadable'

module SitePrism
  class Page

    def initialize

    end

    def initialize(locator)
      if not locator.empty?
        @util = Utils.new("")
        loginPageDisplayed = @util.elementExistsOnTime("xpath", locator, 20)
        if not(loginPageDisplayed) then
          fail(ArgumentError.new("Error when accessing Page."))
        end
      end
    end

  end
end
