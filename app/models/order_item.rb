class OrderItem < ActiveRecord::Base
  belongs_to :sku
  belongs_to :order
  has_one :product, through: :sku

  def product_name
    product.name
  end

  def sku_name
    sku.name
  end

  def total_price
    sku.price * quantity
  end

  def formatted_price
    "$#{sprintf('%.2f', total_price)}"
  end

  def quantity=(count)
    if count.to_i < 1
      write_attribute(:quantity, 1)
    else
      super
    end
  end
end
