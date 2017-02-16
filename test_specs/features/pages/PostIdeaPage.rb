class PostIdeaPage < SitePrism::Page

  # TODO: Update once the new Post Ideas page is ready
  element :publish_button, :xpath, ""

  ##
  # @param [String] attribute   Web element attribute
  #
  def getPublishButtonAttribute(attribute)
    # TODO: Update once the new Post Ideas page is ready
    #return publish_button[attribute].to_s
  end

end