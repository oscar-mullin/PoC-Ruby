class PostIdeaPage < SitePrism::Page

  element :publish_button, :xpath, ""

  ##
  # @param [String] attribute   Web element attribute
  #
  def getPublishButtonAttribute(attribute)
    return publish_button[attribute].to_s
  end

end