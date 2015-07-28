class AbandonedCart
  def self.from(order)
    new(order)
  end

  def initialize(order)
    self.order = order
  end

  def abandon
    order.abandon
  end

  private

  attr_accessor :order
end
