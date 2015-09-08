FactoryGirl.define do
  factory :order_item do
    sku
    order

    quantity 1
  end
end
