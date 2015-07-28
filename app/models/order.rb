class Order < ActiveRecord::Base
  enum status: [ :active, :abandoned, :completed ]

  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :skus, through: :order_items
  has_one :shipping_address

  def total
    order_items.map(&:total_price).inject(0, :+)
  end

  def abandon
    self.status = :abandoned
    save
  end
end
