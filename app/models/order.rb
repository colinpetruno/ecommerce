class Order < ActiveRecord::Base
  enum status: [ :active, :abandoned, :completed ]

  has_many :order_items, dependent: :destroy
  has_many :skus, through: :order_items
end
