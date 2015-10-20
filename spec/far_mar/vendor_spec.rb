require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new(1, "Joe", "10", 4)
  end
  describe "#initialize" do
    it "creates a new instance" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "self.all" do
    it "creates an array of vendors" do
      expect(FarMar::Vendor.all).to be_an Array
    end
  end

  describe "self.find" do
    it "returns an instance of Vendor where the value of the id field in the CSV matches the passed parameter" do
      result = FarMar::Vendor.find(1)
      expect(result).to be_an Object
      expect(result.vendor_id).to eq 1
    end
  end

  describe "market" do
    it "returns the market instance that is associated with the vendor" do
      vendor_market = @vendor.market
      expect(vendor_market).to be_an Object
      expect(vendor_market.market_id).to eq 4
    end
  end
end
