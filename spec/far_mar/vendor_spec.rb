require "spec_helper"

describe Farmer::Vendor do
  before :each do
    @vendor = Farmer::Vendor.new
  end

  context "initializing" do
    it "returns a vendor object" do
      expect(@vendor).to be_an_instance_of Farmer::Vendor
    end
  end
end
