require "spec_helper"

describe FarMar do
  describe FarMar::Vendor do
    describe "initialize" do
      it "creates an instance of a Vendor" do
        @vendor_hash = {
        :id => 123,
        :name => "vendor name",
        :num_employees => "number of employees",
        :market_id => 456
        }
        expect(FarMar::Vendor.new(@vendor_hash)).to be_an_instance_of FarMar::Vendor
      end
    end

    describe "self.all" do
      it "returns an array" do
        expect(FarMar::Vendor.all).to be_an Array
      end
    end

    describe "self.find" do
      it "returns an instance of vendor" do
        num = rand(1..2690)
        expect(FarMar::Vendor.find(num)).to be_an_instance_of FarMar::Vendor
      end
      it "returns an instance of vendor with the correct ID" do
        num = 1
        vendor = FarMar::Vendor.find(num)
        expect(vendor.id).to eq 1
      end
    end
  end
end
