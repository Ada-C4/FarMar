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
    end
    describe "self.all" do
      it "returns an array of 2690 Vendor objects" do
        vendors = FarMar::Vendor.all
        expect(vendors).to be_an(Array)
        expect(vendors.length).to eq(2690)
        expect(vendors[0].id).to eq(1)
        expect(vendors[-1].id).to eq(2690)
      end
    end

    describe ".find(id)" do
      it "returns Vendor object for matching ID" do
        result = FarMar::Vendor.find(2690)
        expect(result).to be_an_instance_of(FarMar::Vendor)
        expect(result.id).to eq(2690)
        expect(result.name).to eq("Mann-Lueilwitz")
        expect(result.emp_num).to eq(4)
        expect(result.market_id).to eq(500)
      end
    end

    describe ".by_market(market_id)" do
      it "returns nil for an invalid market_id" do
        expect(FarMar::Vendor.by_market('a')).to eq([])
        expect(FarMar::Vendor.by_market([1, 2])).to eq([])
        expect(FarMar::Vendor.by_market(-5)).to eq([])
        expect(FarMar::Vendor.by_market(999999999999)).to eq([])
      end
      it "returns all the vendors with the given market_id" do
        vendors = FarMar::Vendor.by_market(12)
        expect(vendors).to be_an_instance_of(Array)
        expect(vendors.length).to eq(3)
        expect(vendors[0].id).to eq(51)
      end
    end
  end
end
