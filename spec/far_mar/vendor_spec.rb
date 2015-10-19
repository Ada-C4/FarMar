require "spec_helper"
require "./lib/far_mar/market"

describe FarMar::Vendor do
  before :each do
    @vendor =FarMar::Vendor.new
  end

  describe "initialize" do
    it "creat a new market" do
      expect(@vendor.name).to eq ""
    end
  end
end
