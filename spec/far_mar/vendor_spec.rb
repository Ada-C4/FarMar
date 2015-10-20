require "spec_helper"

describe FarMar::Vendor do
  before :each do
    row = [1, "Name", 10, 5]
    @vendor = FarMar::Vendor.new(row[0], row[1], row[2], row[3])
  end
  describe ".new" do
    it "creates a new instance of Vendor" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end
  describe "#initialize" do
    it "creates instance variables" do
      expect(@vendor.instance_variables.length).to eq 4
    end
    it "creates @id as an integer" do
      expect(@vendor.id.class).to eq Fixnum
    end
  end
  describe "self.all" do
    it "returns an array" do
      expect(FarMar::Vendor.all).to be_an Array
    end
    it "creates an array of Vendor instances" do
      expect(FarMar::Vendor.all[20]).to be_an_instance_of FarMar::Vendor
    end
  end
  describe "self.find(id)" do
    it "finds a vendor using its ID" do
      @id = 2608
      expect(FarMar::Vendor.find(@id).name).to eq "Funk and Sons"
      @id = 2188
      @vendor = FarMar::Vendor.find(@id)
      expect(FarMar::Market.find(@vendor.market_id).name). to eq "Selma/Dallas County Farmers Market"
    end
  end
  describe "#market" do
    it "returns the market associated with the vendor" do
      @id = 1
      @vendor = FarMar::Vendor.find(@id)
      expect(@vendor.market).to be_an_instance_of FarMar::Market
      expect(@vendor.market.name).to eq "People's Co-op Farmers Market"
    end
  end
  describe "#products" do
    it "returns an array" do
      @id = 2
      @vendor = FarMar::Vendor.find(@id)
      expect(@vendor.products).to be_an Array
      expect(@vendor.products.length).to eq 2
    end
    it "creates an array with vendor products" do
      expect(@vendor.products[0]).to be_an_instance_of FarMar::Product
    end
  end
  describe "#sales" do
    it "returns an array" do
      @id = 1
      @vendor = FarMar::Vendor.find(@id)
      expect(@vendor.sales).to be_an Array
      expect(@vendor.sales.length).to eq 7
    end
    it "creates an array of vendor sale instances" do
      expect(@vendor.sales[5]).to be_an_instance_of FarMar::Sale
    end
  end
  describe "#revenue" do
    it "returns the sum of the vendor's sales" do
      @id = 1
      @vendor = FarMar::Vendor.find(@id)
      expect(@vendor.revenue.class).to eq Fixnum
    end
  end
  describe "self.by_market(market_id)" do
    it "returns an array of vendors for a particular market ID" do
      @id = 1
      @vendor = FarMar::Vendor.find(@id)
      expect(FarMar::Vendor.by_market(@id).length). to eq 6
    end
  end
end
