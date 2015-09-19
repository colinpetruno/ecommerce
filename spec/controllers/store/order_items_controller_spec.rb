require "rails_helper"

RSpec.describe Store::OrderItemsController, type: :controller do
  describe "#create" do
    it "should not create duplicate items in the cart" do
      product = create(:product)
      sku = create(:sku, product_id: product.id)

      order_item_params = attributes_for(:order_item, sku_id: sku.id )

      expect(OrderItem.all.length).to eq 0

      post :create, product_id: product.id, order_item: order_item_params

      expect(OrderItem.all.length).to eq 1

      post :create, product_id: product.id, order_item: order_item_params
      expect(OrderItem.all.length).to eq 1
    end
  end
end
