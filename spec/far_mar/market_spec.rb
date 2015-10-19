require "./spec/spec_helper"

describe FarMar::Market do
  before :each do
    @market1 = FarMar::Market.new(5, "name", "address", "city", "county", "state", "zip")
    @market2 = FarMar::Market.new(6, "name", "address", "city", "county", "state", "zip")
  end
  describe "#initialize" do
    it "creates new instance of market" do
      expect(@market1).to be_instance_of FarMar::Market
      expect(@market2).to be_instance_of FarMar::Market
    end
  end
  describe "#self.all" do
    it "returns an array" do
      expect(FarMar::Market.all).to be_an Array
    end
    it "returns 500 items in array" do
      expect(FarMar::Market.all.length).to eq 500
    end
  end
  describe "#self.find(id)" do
    it "returns an instance of FarMar::Market" do
      expect(FarMar::Market.find(1)).to be_instance_of FarMar::Market
    end
    it "returns correct instance of FarMar::Market" do
      expect(FarMar::Market.find(1).name).to eq "People's Co-op Farmers Market"
      expect(FarMar::Market.find(2).name).to eq "Silverdale Farmers Market"
    end
  end
end
