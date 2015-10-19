require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new
  end
  describe ".new" do
    it "creates a new instance of vendor" do
      expect(@player).to be_an_instance_of FarMar::Vendor
    end
  end
end
