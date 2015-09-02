require 'rails_helper'

RSpec.describe Conversion, type: :model do
  describe ".percentage" do
    it "returns 0 if there is not enough data" do
      conversion_rate = Conversion.percentage()
      expect(conversion_rate).to eq(0)
    end

    it "should properly calculate the conversion percentage" do
      create(:order, session_id: 1)
      create(:order, session_id: 2, status: 0)

      conversion_rate = Conversion.percentage()
      expect(conversion_rate).to eq(50)
    end
  end
end
