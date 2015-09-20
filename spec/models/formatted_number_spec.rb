require "rails_helper"

RSpec.describe FormattedNumber, type: :model do
  describe ".price" do
    it "should have two decimals and start with a dollar sign" do
      expect(FormattedNumber.price(1)).to eq("$1.00")
      expect(FormattedNumber.price(3.3)).to eq("$3.30")
      expect(FormattedNumber.price(4.44)).to eq("$4.44")
    end
  end
end
