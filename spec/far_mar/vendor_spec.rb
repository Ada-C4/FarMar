require "spec_helper"
describe FarMar do
  describe FarMar::Vendor do

    describe "#initialize" do
      before :each do
        vendor_info = CSV.open("./support/vendors.csv", 'r') { |csv| csv.first }
        @vendor = FarMar::Vendor.new(vendor_info)
      end
      it "creates a new instance of the Vendor class" do
        expect(@vendor).to be_an_instance_of(FarMar::Vendor)
      end
      it "retrieves the vendor ID from the vendor info array" do
        expect(@vendor.id).to eq(1)
      end
    end

    describe ".all" do
      before :each do
        @vendors = CSV.read("./support/vendors.csv")
      end
      it "returns an array" do
        expect(FarMar::Vendor.all).to be_an(Array)
      end
      it "returns an array with all the vendors" do
        expect(FarMar::Vendor.all.length).to eq(@vendors.size)
      end
      it "contains instances of the Vendor class" do
        vendor_total = FarMar::Vendor.all.length
        expect(FarMar::Vendor.all[0]).to be_an_instance_of(FarMar::Vendor)
        expect(FarMar::Vendor.all[vendor_total - 1]).to be_an_instance_of(FarMar::Vendor)
        expect(FarMar::Vendor.all[vendor_total]).to be nil
      end
    end

    describe ".find(id)" do
      before :each do
        @id = rand(1..2690)
      end
      it "returns an instance of Vendor" do
        expect(FarMar::Vendor.find(@id)).to be_an_instance_of(FarMar::Vendor)
      end
      it "returns the Vendor with the matching id" do
        expect(FarMar::Vendor.find(@id).id).to eq(@id)
      end
    end

  end
end
