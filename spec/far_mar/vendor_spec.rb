require "spec_helper"
describe FarMar do
  describe FarMar::Vendor do

    describe ".new" do
      before :each do
        @vendor = FarMar::Vendor.new
      end
      it "creates a new instance of the Vendor class" do
        expect(@vendor).to be_an_instance_of(FarMar::Vendor)
      end
    end

    describe ".all" do
      before :each do
        @vendors = CSV.read("./support/vendors.csv")
      end
      it "returns an array" do
        expect(FarMar::Vendor.all).to be_an(Array)
      end
      it "returns an array with the vendor info" do
        expect(FarMar::Vendor.all.length).to eq(@vendors.size)
      end
    end

  end
end
