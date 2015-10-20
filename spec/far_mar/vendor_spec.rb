require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor =FarMar::Vendor.new(6,"Zulauf and Sons",8,1)
  end

  describe "initialize" do
    it "creat a new market" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe ".all" do
    it "returns a collection of Vendors instances" do
      expect(FarMar::Vendor.all).to be_an(Array)
    end
  end

  describe "find" do
    it "return the vendor, usind id " do
      expect(FarMar::Vendor.find(6).name).to eq("Zulauf and Sons")
    end
  end
  
end
