class OrderItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    order_item = OrderItem.new(order_item_params)

    # TODO: Better Error Handling
    order_item.save

    redirect_to product_path(@product)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:sku_id)
  end
end
