class Cart::AbandonedCartsController < ApplicationController
  def create
    AbandonedCart.from(current_order).abandon
    redirect_to root_path
  end
end
