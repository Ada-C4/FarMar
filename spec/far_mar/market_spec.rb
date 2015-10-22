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

  describe "vendors" do
    before :each do
      @market_array = @market.vendors
    end

    it "returns a collection of FarMar::Vendor" do
      expect(@market_array).to be_an_instance_of(Array)
    end
  end

  describe "products" do
    it "return an array of products" do
    expect(@market.products).to be_an(Array)
    end

    it "return the right array" do
    expect(@market.products[0].id).to eq 732
    end
  end

  describe "prefered_vendor" do
    it "return the best seller vendor" do
    expect(@market.prefered_vendor).to be_an_instance_of(FarMar::Vendor)
    end
  end

  describe "worst vendor" do
    it "returns a vendor" do
      expect(@market.worst_vendor).to be_an_instance_of(FarMar::Vendor)
    end
  end
end

#     it "return vendors that associated with the market"
#       expact(@market_array).to include
#   end
# end
