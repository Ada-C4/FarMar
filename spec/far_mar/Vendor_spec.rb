require 'spec_helper'
describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new("2689", "Durgan-Moen", "1", "500")
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
  describe "#find(id)" do
    it "returns the vendor instance with an id matching the parameter" do
      expect(FarMar::Vendor.find(556).id).to eq 556
    end
  end
  describe ".market" do
    it "returns the market instance whose id matches the vendor's market_id" do
      expect(@vendor.market.id).to eq 500
      expect(@vendor.market.name).to eq "Montefiore Medical Center Farmers Market_Thursday"
    end
  end
  describe ".products" do
    it "returns a collection of all product instances whose vendor_id matches the vendor's id" do
      expect(@vendor.products.length).to eq 5
      expect(@vendor.products[3].class).to eq FarMar::Product
    end
  end
end
