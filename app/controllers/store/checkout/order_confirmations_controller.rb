class Store::Checkout::OrderConfirmationsController < Store::BaseController
  def new
    @order_confirmation = OrderConfirmation.from(current_order)
  end

  def create
    @order_confirmation = OrderConfirmation.from(current_order)
    # @order_confirmation.process_order
  end

  def current_order
    Order.find(28)
  end
end
