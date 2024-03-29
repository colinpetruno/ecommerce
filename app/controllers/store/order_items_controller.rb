class Store::OrderItemsController < Store::BaseController
  respond_to :html, :js

  def create
    @product = Product.find(params[:product_id])
    order = current_order

    @order_item = OrderItem.
      find_or_create_by!( { order_id: order.id }.merge(order_item_params))

    respond_with @product do |format|
      format.html { redirect_to product_path(@product) }
    end
  end

  def update
    @order_item = OrderItem.find(params[:id])

    @order_item.update(order_item_params)
  end

  def destroy
    # TODO: MAKE THIS NOT DELETE BUT HIDE
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy

    respond_with @product do |format|
      format.html { redirect_to product_path(@product) }
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:sku_id, :quantity)
  end
end
