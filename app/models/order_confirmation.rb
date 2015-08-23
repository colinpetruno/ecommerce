class OrderConfirmation
  include ActiveModel::Model

  attr_accessor(
    :order
  )

  delegate :address_1, :address_2, :city, :state, :zip, to: :shipping_address
  delegate :order_items, to: :order

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

  def address_line_2
    "address_2" + content_tag(:br) if address_2.present?
  end

  def address_line_3
    "#{city} #{state} #{zip}"
  end

  private

  def shipping_address
    order.shipping_address
  end
end
