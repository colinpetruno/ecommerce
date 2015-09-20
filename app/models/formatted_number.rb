class FormattedNumber
  def self.price(integer)
    sprintf "$%.2f", integer
  end
end
