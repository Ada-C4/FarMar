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
  describe "#by_market(market_id)" do
    it "returns all vendor instances whose market_id matches the parameter passed in" do
      vendors = FarMar::Vendor.by_market(498)
      expect(vendors.length).to eq 2
      expect(vendors[1].class).to eq FarMar::Vendor
    end
  end
  describe ".revenue(date)" do
    context "when no date parameter is passed in" do
      it "returns total revenue from all dates" do
        expect(@vendor.revenue).to eq 7586
      end
      it "returns 0 when vendor had no sales" do
        @vendor_0_sales = FarMar::Vendor.new("51", "Bernier Inc", "1", "12")
        expect(@vendor_0_sales.revenue).to eq 0
      end
    end
    context "when no sales happened on date" do
      it "returns 0" do
        expect(@vendor.revenue("2013-11-09")).to eq 0
      end
    end
    context "when 1 sale happened on date" do
      it "returns the sale amount" do
        expect(@vendor.revenue("2013-11-10")).to eq 3793
      end
    end
    context "when multiple sales happened on date" do
      it "returns the sum of sales amounts for the date" do
        @vendor2 = FarMar::Vendor.new("2687", "Pacocha Group", "5", "500")
        expect(@vendor2.revenue("2013-11-12")).to eq 20781
      end
    end
  end
end
