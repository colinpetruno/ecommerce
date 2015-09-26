class Store::CategoriesController < Store::BaseController
  def index
    @categories = Category.all.includes(:products)
  end

  def show
    @category = Category.includes(:products).find(params[:id])
  end
end
