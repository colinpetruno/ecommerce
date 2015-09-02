class Dashboard
  include ActiveModel::Model

  def initialize(order_class: Order, conversion_class: Conversion)
    @order_class = order_class
    @conversion_class = conversion_class
  end

  def conversion_rate
    conversion_class.percentage
  end

  private

  attr_reader :order_class, :conversion_class
end
