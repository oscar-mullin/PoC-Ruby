class IdeaTemplateEditorPage < SitePrism::Page

 def fieldDisplayed?(field_label)
   return has_xpath?(".//li[contains(@id,'frm') and contains(@id,'item') and div[@class='legend'] and contains(.,'#{field_label}')]")
 end

end