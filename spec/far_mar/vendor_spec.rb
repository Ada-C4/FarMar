require "./spec/spec_helper"

describe FarMar::Vendor do
  describe "#initialize" do
    it "creates new instance of vendor" do
      @vendor1 = FarMar::Vendor.new
      @vendor2 = FarMar::Vendor.new
      expect(@vendor1).to be_instance_of FarMar::Vendor
      expect(@vendor2).to be_instance_of FarMar::Vendor
    end
  end
end
