class OrderItem < ActiveRecord::Base
  belongs_to :sku
  belongs_to :order
  has_one :product, through: :sku

  def full_name
    "#{product.name} - #{sku.name}"
  end

  def short_description
    "some placeholder, add column later"
  end

  def total_price
    sku.price * quantity
  end

  def formatted_price
    "$#{sprintf('%.2f', total_price)}"
  end
end
