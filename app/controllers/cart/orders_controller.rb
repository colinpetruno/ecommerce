class Cart::OrdersController < ApplicationController
  def edit
    @order = current_order
  end
end
