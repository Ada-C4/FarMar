require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor =FarMar::Vendor.new("Hamill", "Kilback and Pfeffer",5,1)
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
end
