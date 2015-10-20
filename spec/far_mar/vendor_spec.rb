require 'spec_helper'

describe FarMar do
  describe FarMar::Vendor do
    describe "#initialize" do
      it "creates a new Vendor instance" do
        v_array = %w(1 QFC 10 2)
        v_hash = FarMar::Vendor.convert_to_hash(v_array)
        vendor = FarMar::Vendor.new(v_hash)
        expect(vendor).to be_an_instance_of(FarMar::Vendor)
        expect(vendor.id).to eq(1)
        expect(vendor.name).to eq("QFC")
        expect(vendor.emp_num).to eq(10)
        expect(vendor.market_id).to eq(2)
      end
      it "returns an array of 2690 Vendor objects" do
        vendors = FarMar::Vendor.all
        expect(vendors).to be_an(Array)
        expect(vendors.length).to eq(2690)
        expect(vendors[0].id).to eq(1)
        expect(vendors[-1].id).to eq(2690)
      end

    end
  end
end
