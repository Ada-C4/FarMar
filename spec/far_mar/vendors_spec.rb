require "./spec/spec_helper.rb"
require "./lib/far_mar/vendor_class.rb"

describe FarMar::Vendor do
  describe "initialize"
  before :each do
    @vendor_test = FarMar::Vendor.new
  end
    it "creates a new instace of the vendor class" do
      expect(@vendor_test).to be_an_instance_of FarMar::Vendor
    end
end
