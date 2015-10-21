require "spec_helper"

describe FarMar::Vendor do
  describe "initialize" do
    it "creates an instance of a market" do
      expect(FarMar::Vendor.new({})).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "self.all" do
    it "returns an array or all the vendors" do
      expect(FarMar::Vendor.all.length).to eq 2690
    end
  end

  describe "self.find" do
    it "returns a vendor given an id" do
      expect(FarMar::Vendor.find(4).name).to eq "Kris and Sons"
    end
  end
end
