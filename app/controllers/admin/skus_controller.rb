class Admin::SkusController < Admin::BaseController

  def new
    @product = Product.find(params[:product_id])
    @sku = @product.skus.build
  end

  def create
    @product = Product.find(params[:product_id])
    @sku = @product.skus.build(sku_params)

    if @sku.save
      redirect_to edit_admin_product_path(@product)
    else
      render :new
    end
  end

  def edit
    @sku = Sku.find(params[:id])
    @product = @sku.product
  end

  def update
    @sku = Sku.find(params[:id])

    if @sku.update(sku_params)
      redirect_to edit_admin_product_path(@sku.product)
    else
      render :edit
    end
  end

  def destroy
    @sku = Sku.find(params[:id])

    if @sku.destroy
      redirect_to edit_admin_product_path(@sku.product)
    else
      render :edit
    end
  end

  private

  def sku_params
    params.require(:sku).permit(:name, :price)
  end
end
