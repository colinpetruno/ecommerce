class Order < ActiveRecord::Base
  enum status: [ :active, :abandoned, :completed ]

  has_many :order_items, dependent: :destroy
  has_many :skus, through: :order_items

  def total
    order_items.map(&:total_price).inject(0, :+)
  end
end
