require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe "#quantity" do
    it "should not be able to be less than one" do
        order_item = build(:order_item, quantity: 3)
        order_item.quantity = 0

        expect(order_item.quantity).to eql 1

        order_item.quantity = 3

        expect(order_item.quantity).to eql 3
    end
  end
end
