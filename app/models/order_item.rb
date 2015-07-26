class OrderItem < ActiveRecord::Base
  belongs_to :sku
  belongs_to :order
  has_one :product, through: :sku

  def full_name
    "#{product.name} - #{sku.name}"
  end

  def total_price
    sku.price * quantity
  end
end
