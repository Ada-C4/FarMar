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
    it "creates a new instance of Vendor with 4 instance variables" do
      expect(@vendor.instance_variables.length).to eq 4
    end
    it "creates a new instance of Vendor with @id as an integer" do
      expect(@vendor.id.class).to eq Fixnum
    end
  end
  describe "self.all" do
    it "returns an array of Vendor instances" do
      expect(FarMar::Vendor.all).to be_an Array
    end
    it "returns an array with 2690 Vendor instances" do
      expect(FarMar::Vendor.all.length).to eq 2690
    end
  end
  describe "self.find(id)" do
    it "returns the corresponding vendor name for a particular vendor id" do
      @id = 2608
      expect(FarMar::Vendor.find(@id).name).to eq "Funk and Sons"
    end
    it "returns the corresponding Market name for a particular vendor" do
      @id = 2188
      @vendor = FarMar::Vendor.find(@id)
      expect(FarMar::Market.find(@vendor.market_id).name). to eq "Selma/Dallas County Farmers Market"
    end
  end
  describe "#market" do
    before :each do
      @id = 1
      @vendor = FarMar::Vendor.find(@id)
    end
    it "returns the instance of FarMar::Market that is associated with the vendor" do
      expect(@vendor.market).to be_an_instance_of FarMar::Market
      expect(@vendor.market.name).to eq "People's Co-op Farmers Market"
    end
  end
  describe "#products" do
    before :each do
      @id = 2
      @vendor = FarMar::Vendor.find(@id)
    end
    it "returns an array of products for a particular vendor" do
      expect(@vendor.products).to be_an Array
      expect(@vendor.products.length).to eq 2
    end
    it "checks that an element of the array returned by #products is an instance of the Product class" do
      expect(@vendor.products[0]).to be_an_instance_of FarMar::Product
    end
    it "checks the name of the first product in the array of vendor products" do
      expect(@vendor.products[0].name).to eq "Fierce Greens"
    end
  end
end
