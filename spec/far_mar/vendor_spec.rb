require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new
end

  describe "new vendor instance" do
    it "creats a new vendor instance" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end
end
