require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "#total_items" do
    it "should calculate total items in an order" do
      order_item = create(:order_item)
      order = order_item.order
      create(:order_item, order: order, quantity: 2)

      expect(order.total_items).to eq(3)
    end
  end
end
