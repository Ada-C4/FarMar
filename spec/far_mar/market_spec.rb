require "./spec/spec_helper"

describe FarMar::Market do
  describe "#initialize" do
    it "creates new instance of market" do
      @market1 = FarMar::Market.new
      @market2 = FarMar::Market.new
      expect(@market1).to be_instance_of FarMar::Market
      expect(@market2).to be_instance_of FarMar::Market
    end
  end
end
