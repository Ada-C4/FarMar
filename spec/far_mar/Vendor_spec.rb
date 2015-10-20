require 'spec_helper'
describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new("6", "Zulauf and Sons", "8", "1")
  end
  describe "#new" do
    it "creates a new Vendor instance" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end
  describe "#all" do
    it "creates a new Vendor instance" do
      expect(FarMar::Vendor.all[3].market_id).to eq 1
    end
    it "returns a collection representing all vendors in CSV" do
      expect(FarMar::Vendor.all.length).to eq 2690
    end
  end
end
