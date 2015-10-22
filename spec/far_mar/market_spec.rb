require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new(1, 2, 3, 4, 5, 6, 7)
  end

  describe "Market.new" do
    it "creates a new instance of a market" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end

  describe ".all" do
    it "returns an array" do
      expect(FarMar::Market.all).to be_an Array
    end
  end

  describe ".find" do
    it "returns a single market" do
      expect(FarMar::Market.find(1)).to be_an_instance_of FarMar::Market
    end

    it "returns a specific market" do
      expect(FarMar::Market.find(14).id).to eq 14
    end
  end

  describe "#vendors" do
    before :each do
      @vendors = FarMar::Vendor.new(1,2,3,4)
    end
    it "returns an array of vendors" do
      expect(@market.vendors).to be_an Array
    end

    # it "returns an array" do
    #   expect(@vendors.vendors).to eq 4
    # end
  end
end
