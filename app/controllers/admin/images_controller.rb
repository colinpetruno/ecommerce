class Admin::ImagesController < Admin::BaseController
  def new
    @product = Product.find(params[:product_id])
    @image = @product.images.build
  end

  def create
    @product = Product.find(params[:product_id])
    @image = @product.images.build(image_params)

    if @image.save
      redirect_to edit_admin_product_path(@product)
    else
      render :new
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to edit_admin_product_path(@image.product)
  end

  private

  def image_params
    params.require(:image).permit(:resource, :product_id)
  end
end
