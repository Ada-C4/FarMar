require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new(1, 2, 3, 1)
  end

  describe "Vendor.new" do
    it "creates a new instance of a market" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe ".all" do
    it "returns an array" do
      expect(FarMar::Vendor.all).to be_an Array
    end
  end

  describe ".find" do
    it "returns a single vendor" do
      expect(FarMar::Vendor.find(2)).to be_an_instance_of FarMar::Vendor
    end

    it "returns a specific vendor" do
      expect(FarMar::Vendor.find(2).id).to eq 2
    end
  end

  describe "#market" do
    it "returns a specific market" do
      expect(@vendor.market).to be_an_instance_of FarMar::Market
    end
  end

  describe "#products" do
    it "returns an array of products" do
      expect(@vendor.products).to be_an Array
    end
  end

  describe "#sales" do
    it "returns an array of sales" do
      expect(@vendor.sales).to be_an Array
    end
  end

  describe "#revenue" do
    it "returns a number of cents" do
      expect(@vendor.revenue).to be > 0
    end
  end

  describe ".by_market" do
    it "returns an array of vendors" do
      expect(FarMar::Vendor.by_market(1)).to be_an Array
    end
  end



end
