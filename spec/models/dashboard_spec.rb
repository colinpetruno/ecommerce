require 'rails_helper'

RSpec.describe Dashboard do
  describe "#conversion_rate" do
    it "should initialize conversion and call percentage" do
      conversion = double(:conversion)
      expect(conversion).to receive(:percentage).once
      allow(Conversion).to receive(:new).and_return(conversion)

      Dashboard.new.conversion_rate
    end
  end
end
