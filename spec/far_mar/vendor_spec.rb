require "spec_helper"

describe FarMar::Vendor do
    before :each do
      @vendor = FarMar::Vendor.new("1","Frank's Farm" , "4", "1")
      @all_vendors = FarMar::Vendor.all
    end
    describe ".new" do
      it "creates a new instance of vendor" do
        expect(@vendor).to be_an_instance_of FarMar::Vendor
      end
    end
    describe "#id" do
      it "returns unique id for the vendor" do
        expect(@vendor.id).to eq 1
      end
    end
    describe "#name" do
      it "returns the name for the vendor" do
        expect(@vendor.name).to eq "Frank's Farm"
      end
    end
    describe "#employees" do
      it "returns the number of employees for the vendor" do
        expect(@vendor.employees).to eq 4
      end
    end
    describe "#market_id" do
      it "returns the market id for the vendor" do
        expect(@vendor.market_id).to eq 1
      end
    end
    describe "self.all" do
      it "creates an array" do
        expect(@all_vendors).to be_an Array
      end
      it "elements are instances of FarMar::Vendor" do
        expect(@all_vendors[0]).to be_an_instance_of FarMar::Vendor
      end
      it "creates a vendor for each row in the csv file" do
        expect(@all_vendors.length).to eq 2690
      end
    end
    describe "self.find(id)" do
      it "returns an instance of vendor with the passed id" do
        vendor_1000 = FarMar::Vendor.find(1000)
        expect(vendor_1000).to be_an_instance_of FarMar::Vendor
        expect(vendor_1000.id).to eq 1000
      end
    end
    describe "#market" do
      it "returns the market instance associated with this vendor" do
        expect(@vendor.market).to be_an_instance_of FarMar::Market
        expect(@vendor.market.id).to eq 1
      end
    end
    describe "#products" do
      it "returns a collection of products associated with this vendor" do
        vendor = FarMar::Vendor.new("11","Donnelly-Quigley","7","3")
      expect(vendor.products).to be_an Array
      expect(vendor.products[2]).to be_an_instance_of FarMar::Product
      expect(vendor.products[3].vendor_id).to eq 11
    end
  end
  describe "#sales" do
    it "returns all sales associated with the vendor" do
      vendor = FarMar::Vendor.new("4","Kris and Sons","5","1")
    expect(vendor.sales).to be_an Array
    expect(vendor.sales[3]).to be_an_instance_of FarMar::Sale
    expect(vendor.sales[1].vendor_id).to eq 4
    end
  end
  describe "#revenue" do
    it "returns the sum of the vendor's sales" do
        vendor = FarMar::Vendor.new("7","Bechtelar Inc","4","2")
      expect(vendor.revenue).to be_a Fixnum
      expect(vendor.revenue).to eq 39719
    end
  end
  describe "self.by_market(market_id)" do
    it "returns all of the vendors with a given market_id" do
      market_vendors_9 = FarMar::Vendor.by_market(9)
      expect(market_vendors_9).to be_an Array
      expect(market_vendors_9[2]).to be_an_instance_of FarMar::Vendor
      expect(market_vendors_9[3].market_id).to eq 9
    end
  end
  describe "self.most_revenue(n)" do
    it "returns the top n vendor instances ranked by total revenue" do
      top_3 = FarMar::Vendor.most_revenue(3)
      expect(top_3).to be_an Array
      expect(top_3[0]).to be_an_instance_of FarMar::Vendor
      expect(top_3.length).to eq 3
      expect(top_3[0].revenue >= top_3[2].revenue).to be_truthy
    end
  end
  describe "self.most_items(n)" do
    it "returns the top n vendor instances ranked by number of items sold" do
      top_4 = FarMar::Vendor.most_items(4)
      expect(top_4).to be_an Array
      expect(top_4[0]).to be_an_instance_of FarMar::Vendor
      expect(top_4.length).to eq 4
      expect(top_4[0].products.length >= top_4[3].products.length).to be_truthy
    end
  end
end
