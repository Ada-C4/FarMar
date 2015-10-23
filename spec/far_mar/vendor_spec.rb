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
    it "returns vendor instance where the value of the id the passed parameter" do
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

  describe "products" do
    it "returns a collection of product instances that are associated with vendor_id" do
      vendor_product_array = @vendor.products
      expect(vendor_product_array).to be_an Array
      expect(vendor_product_array.length).to eq 1
    end
  end

  describe "sales" do
    it "return a collection of sale instances that are associated with vendor_id" do
      vendor_sale_array = @vendor.sales
      expect(vendor_sale_array).to be_an Array
      expect(vendor_sale_array.length).to eq 7
    end
  end

  describe "revenue" do
    it "returns the sum of all of the vendor's sales" do
      total_sales = @vendor.revenue
      expect(total_sales).to eq 38259
    end
  end

  describe "self.by_market(market_id)" do
    it "returns all of the vendors with the given market_id" do
      vendors_at_market = FarMar::Vendor.by_market(4)
      expect(vendors_at_market).to be_an Array
      expect(vendors_at_market.length).to eq 4
      expect(vendors_at_market[0].vendor_id).to eq 13
    end
  end
end
