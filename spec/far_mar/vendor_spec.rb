require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new(1, 2, 3, 4)
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
end
