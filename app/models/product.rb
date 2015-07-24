class Product < ActiveRecord::Base
  belongs_to :category
  has_many :skus

  def price_range
    # TODO: Add Test
    prices = skus.map(&:price).sort
    if prices.blank?
      "Not Available"
    else
      [prices.first, prices.last].uniq.join(" - ")
    end
  end
end
