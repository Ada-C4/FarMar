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
      market = @vendor.market
      expect(market.id).to eq 500
      expect(market.name).to eq "Montefiore Medical Center Farmers Market_Thursday"
    end
  end
  describe ".products" do
    it "returns a collection of all product instances whose vendor_id matches the vendor's id" do
      product = @vendor.products
      expect(product.length).to eq 5
      expect(product[3].class).to eq FarMar::Product
    end
  end
  describe ".sales" do
    it "returns a collection of all sales instances whose vendor_id matches the vendor's id" do
      sale = @vendor.sales
      expect(sale.length).to eq 2
      expect(sale[1].class).to eq FarMar::Sale
    end
  end
  describe ".revenue" do
    it "returns the sum of all amounts for sales instances whose vendor_id matches the vendor's id" do
      expect(@vendor.revenue).to eq 7586
    end
  end
end
