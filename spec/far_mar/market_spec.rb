require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new(1, "Meighan", "1234 N St", "Seattle", "WA", "King", "98103")
  end
  describe "#initialize" do
    it "creates a new instance" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end

  describe "self.all" do
    it "creates an array of markets" do
      expect(FarMar::Market.all).to be_an Array
    end
  end

  describe "self.find" do
    it "returns market instance where the value of the id the passed parameter" do
      result = FarMar::Market.find(3)
      expect(result).to be_an Object
      expect(result.market_id).to eq 3
    end
  end

  describe "vendors" do
    it "return a collection of vendor instances that are associated with market_id" do
      market_vendor_array = @market.vendors
      expect(market_vendor_array).to be_an Array
      expect(market_vendor_array.length).to eq 6
    end
  end
end
