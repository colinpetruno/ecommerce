class OrderItem < ActiveRecord::Base
  belongs_to :sku
  belongs_to :order
  has_one :product, through: :sku
end
