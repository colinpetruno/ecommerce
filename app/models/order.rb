class Order < ActiveRecord::Base
  include Filterable

  enum status: [ :active, :abandoned, :completed ]

  belongs_to :user
  belongs_to :funding_instrument

  has_many :coupons, through: :discounts
  has_many :order_items, dependent: :destroy
  has_many :skus, through: :order_items
  has_one :shipping_address

  def sub_total
    order_items.map(&:total_price).inject(0, :+)
  end

  def total
    # will need to add tax
    sub_total
  end

  def total_in_cents
    (total * 100).to_i
  end

  def total_items
    order_items.sum(:quantity)
  end

  def process
    funding_instrument.charge(self)
  end

  def abandon
    self.status = :abandoned
    save
  end
end
