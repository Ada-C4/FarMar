require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = Vendor.new
  end

  describe "initialize" do
    it "creat a new market" do
      expect(@vendor.name).to be_a(String)
    end
  end
end
