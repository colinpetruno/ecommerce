class Store::Cart::OrdersController < Store::BaseController
  def edit
    @order = current_order
  end
end
