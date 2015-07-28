class Checkout::OrderConfirmationsController < ApplicationController
  def new
    @order_confirmation = OrderConfirmation.from(current_order)
  end

  def create
    @order_confirmation = OrderConfirmation.from(current_order)
    @order_confirmation.process_order
    # TODO Redirect somewhere
  end
end
