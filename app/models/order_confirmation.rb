class OrderConfirmation
  include ActiveModel::Model

  attr_accessor(
    :order
  )

  def self.from(order)
    new(order)
  end

  def initialize(order)
    unless order.is_a?(Order)
      raise ArgumentError.new("OrderConfirmation Requires an Order")
    end

    self.order = order
  end

  def process_order
    # TODO: Move to Order?
    if order.process
      order.status = :completed
      order.save
    end
  end
end
