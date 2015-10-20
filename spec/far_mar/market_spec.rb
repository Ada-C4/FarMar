require "spec_helper"

describe FarMar::Market do
  before :each do
    @market=FarMar::Market.new(233,"market", "123","Seattle", "King county", "WA", "98034")
  end

  describe "initialize" do
    it "creat a new market" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end

  describe ".all" do
    it "returns an array of Market instances" do
      expect(FarMar::Market.all).to be_an(Array)
    end
  end

  describe "find" do
    it "return an instence of Market" do
      market1 = FarMar::Market.find(1)
      expect(market1.city).to eq("Portland")
    end
  end
end
