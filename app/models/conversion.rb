class Conversion
  def self.percentage(order_class: Order)
    new(order_class: order_class).percentage
  end

  def initialize(order_class: Order)
    @order_class = order_class
  end

  def percentage
    (conversion_rate * 100.to_f).to_i
  end

  private

  attr_reader :order_class

  def conversion_rate
    return 0 unless calculatable?
    processed_orders.to_f / distinct_orders.to_f
  end

  def calculatable?
    distinct_orders.present? && distinct_orders > 0
  end

  def processed_orders
    order_class.where(status: 2).count
  end

  def distinct_orders
    order_class.distinct.count(:session_id)
  end
end
