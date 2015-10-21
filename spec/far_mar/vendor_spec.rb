require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new(45,"Hyatt, Conroy and Ortiz",5,10)
  end

  context "initializing" do
    it "returns a vendor object" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end
end
