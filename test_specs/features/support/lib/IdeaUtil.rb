class IdeaUtil

  def getCurrentIdea
    @@currentIdea
  end

  def setCurrentIdea(idea)
    @@currentIdea = idea
  end

  def getIdeaTitle(idea)
    if !$devmod
      @@ideaTitles[idea]
    else
      return idea
    end
  end

  def getIdeaTitleHash
    @@ideaTitles
  end

  def setIdeaTitleHash(new_array)
    @@ideaTitles = new_array
  end

  def addIdeaTitle(idea)
    if !$devmod
      suffix = (Time.now.to_f*1000).to_i.to_s
      ideaTitle = idea + ' ' + suffix
      @@ideaTitles[idea] = ideaTitle
    else
      return idea
    end
  end

  def getCategoryTitle(category)
    if !$devmod
      @@categoryTitles[category]
    else
      return category
    end
  end

  def addCategoryTitle(category)
    if !$devmod
      categoryTitle = Forgery('lorem_ipsum').words(5, :random => true).capitalize
      @@categoryTitles[category] = categoryTitle
      return categoryTitle
    else
      return category
    end
  end
end