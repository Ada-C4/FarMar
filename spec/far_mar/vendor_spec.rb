require 'spec_helper'

describe FarMar do
  describe FarMar::Vendor do
    vendor_hash = FarMar::Vendor.convert_to_hash(["70","Eichmann Group","8","16"])
    let(:sample_vendor) { FarMar::Vendor.new(vendor_hash) }
    describe "#initialize" do
      it "creates a new Vendor instance" do
        expect(sample_vendor).to be_an_instance_of(FarMar::Vendor)
        expect(sample_vendor.id).to eq(70)
        expect(sample_vendor.name).to eq("Eichmann Group")
        expect(sample_vendor.emp_num).to eq(8)
        expect(sample_vendor.market_id).to eq(16)
      end
    end
    describe "self.all" do
      it "returns an array of 2690 Vendor objects" do
        FarMar::Vendor.all
        expect(FarMar::Vendor.all_objects).to be_an(Array)
        expect(FarMar::Vendor.all_objects.length).to eq(2690)
        expect(FarMar::Vendor.all_objects[0].id).to eq(1)
        expect(FarMar::Vendor.all_objects[-1].id).to eq(2690)
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
      it "returns empty array for an invalid market_id" do
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

    describe "#products" do
      it "returns a collection of Products with the vendor's ID" do
        products = sample_vendor.products
        expect(products).to be_an(Array)
        expect(products.length).to eq(5)
        expect(products[0].id).to eq(221)
        expect(products[-1].name).to eq("Cheerful Bread")
      end
    end

    describe "#sales" do
      it "returns a collection of Sales with the vendor's ID" do
        sales = sample_vendor.sales
        expect(sales).to be_an(Array)
        expect(sales.length).to eq(7)
        expect(sales[0].id).to eq(313)
        expect(sales[-1].id).to eq(319)
      end
    end
  end
end
