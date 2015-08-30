class Store::ProductsController < Store::BaseController
  def show
    @product = Product.find(params[:id])
  end
end
