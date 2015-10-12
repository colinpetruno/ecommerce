class CategoryDecorator
  def initialize(category)
    @category = category
  end

  def header_image
    if @category.header_image.present?
      @category.header_image.resource.url
    else
      nil
    end
  end

  def name
    @category.name
  end

  def products
    @category.products
  end
end
