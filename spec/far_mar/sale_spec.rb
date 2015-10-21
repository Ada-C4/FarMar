require 'spec_helper'

describe FarMar do
  describe FarMar::Sale do
    describe "#initialize" do
      it "creates a new Sale instance" do
        fake_array = ["1", "9290", "2013-11-12 04:36:56 -0800", "5", "12"]
        fake_hash = FarMar::Sale.convert_to_hash(fake_array)
        sale = FarMar::Sale.new(fake_hash)
        expect(sale).to be_an_instance_of(FarMar::Sale)
        expect(sale.id).to eq(1)
        expect(sale.amount).to eq(9290)
        expect(sale.purchase_time.class).to be(DateTime)
        expect(sale.vendor_id).to eq(5)
        expect(sale.product_id).to eq(12)
      end
    end
    describe ".all" do
      it "returns an array of 12798 Sale objects" do
        all_sales = FarMar::Sale.all
        expect(all_sales).to be_an(Array)
        expect(all_sales[0].id).to eq(1)
        expect(all_sales[0].product_id).to eq(1)
        expect(all_sales[-1].id).to eq(12001)
        expect(all_sales[-1].product_id).to eq(8192)
        expect(all_sales.length).to eq(12798)
      end
    end

    describe ".find(id)" do
      it "returns Sale object for matching ID" do
        result = FarMar::Sale.find(19)
        expect(result).to be_an_instance_of(FarMar::Sale)
        expect(result.id).to eq(19)
        expect(result.amount).to eq(9035)
        expect(result.vendor_id).to eq(4)
        expect(result.product_id).to eq(6)
      end
    end

    describe ".by_product(product_id)" do
      it "returns empty array for an invalid product_id" do
        expect(FarMar::Sale.by_product('a')).to eq([])
        expect(FarMar::Sale.by_product([1, 2])).to eq([])
        expect(FarMar::Sale.by_product(-5)).to eq([])
        expect(FarMar::Sale.by_product(999999999999)).to eq([])
      end
      it "returns all the products with the given product_id" do
        products = FarMar::Sale.by_product(14)
        expect(products).to be_an_instance_of(Array)
        expect(products.length).to eq(7)
        expect(products[0].id).to eq(32)
        expect(products[-1].id).to eq(38)
      end
    end
  end
end
