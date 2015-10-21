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
end
