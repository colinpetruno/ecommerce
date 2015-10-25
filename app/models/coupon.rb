class Coupon < ActiveRecord::Base
  belongs_to :user
  has_many :orders, through: :discounts
end
