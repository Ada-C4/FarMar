require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new
  end

  describe "Vendor.new" do
    it "creates a new instance of a market" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end
end
