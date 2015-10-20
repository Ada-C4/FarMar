require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor =FarMar::Vendor.new
  end

  describe "initialize" do
    it "creat a new market" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "self.all" do
    it "returns a collection of Vendor instances"
  end
end
