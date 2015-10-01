class Store::ProductsController < Store::BaseController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
end
