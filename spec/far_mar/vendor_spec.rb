require "spec_helper"

describe FarMar::Vendor do
  describe "initialize" do
    it "creates an instance of a market" do
      expect(FarMar::Vendor.new).to be_an_instance_of FarMar::Vendor
    end
  end
end
