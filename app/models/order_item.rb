class OrderItem < ActiveRecord::Base
  belongs_to :sku
  belongs_to :order
end
