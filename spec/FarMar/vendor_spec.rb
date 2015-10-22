require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new(6,"Zulauf and Sons",8 ,1)
  end

  describe ".new" do
      it "creates a new instance of Vendor" do
        expect(@vendor).to be_an_instance_of FarMar::Vendor
      end
  end

  describe "self.all" do
    it "creates an array of instances of the Vendor class" do
    expect(FarMar::Vendor.all).to be_an Array
    end
  end

  describe "self.findall" do
    it "returns the vendors that match the ID passed in as a parameter" do
    twelve = FarMar::Vendor.find(12)
    expect(twelve).to be_an_instance_of FarMar::Vendor
    expect(twelve.id).to eq 12
    end
  end

  describe "market" do
    it "returns a specific market" do
    expect(@vendor.market).to be_an_instance_of FarMar::Market
    end
  end

  describe "products" do
    it "is an Array" do
    expect(@vendor.products).to be_an Array
    end
    it "returns product instances that match the vendor_id specified" do
    vendor6 = @vendor.products
    expect(vendor6.length).to eq 3
    end
  end
  #.each to look at all the products and then check that the product has a
  #vendor id that matches this vendor 

  describe "sales" do
    it "returns sales instances that match the vendor_id specified" do
    vendor6 = @vendor.sales
    expect(vendor6.length).to be 1
    end
  end

  describe "revenue" do
    it "returns the total revenue for a specified vendor" do
    expect(@vendor.revenue).to be > 0
    end
  end

  describe "#by_market" do
    it "returns all of the vendors with the given market_id" do
      vendor6 = FarMar::Vendor.by_market(7)
      expect(vendor6.length).to eq 2
    end
  end

end
