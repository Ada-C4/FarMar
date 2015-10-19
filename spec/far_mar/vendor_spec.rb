require "spec_helper"

describe "creating a vendor class" do
  before :each do
    @vendor = FarMar::Vendor.new
  end

  context "initializing" do
    it "returns a vendor object" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end
end