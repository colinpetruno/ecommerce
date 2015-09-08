class Admin::OrdersController < Admin::BaseController

  def index
    @orders = Order.filter(filter_params)
  end

  private

  def filter_params
    params.slice(:status)
  end
end
