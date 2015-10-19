require "spec_helper"

describe FarMar do
  describe FarMar::Vendor do
    before :each do
      @vendor = FarMar::Vendor.new
    end

    describe "#initialize" do
      it "creates a new instance of Vendor" do
        expect(@vendor).to be_an_instance_of FarMar::Vendor
      end
    end
  end
end
