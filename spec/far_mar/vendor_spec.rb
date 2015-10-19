require "spec_helper"

describe FarMar::Market do
  before :each do
    @vendor = FarMar::vendor.new
  end
  describe "#initialize" do
    it "creates a new instance" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end
end
