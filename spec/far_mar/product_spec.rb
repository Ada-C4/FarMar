require 'spec_helper'

describe FarMar do
  describe FarMar::Product do
    product_hash = FarMar::Product.convert_to_hash(["14","Stupendous Carrots","7"])
    let(:sample_product) { FarMar::Product.new(product_hash) }
    describe "#initialize" do
      it "creates a new Product instance" do
        expect(sample_product).to be_an_instance_of(FarMar::Product)
      end
      product_hash.each do |attr, val|
        it "assigns the #{attr} attribute correctly" do
          expect(sample_product.instance_variable_get("@#{attr}")).to eq(val)
        end
      end
    end

    describe ".all" do
      it "returns an array of 8193 Product objects" do
        all_products = FarMar::Product.all
        expect(all_products).to be_an(Array)
        expect(all_products.length).to eq(8193)
        expect(all_products[0]).to be_an_instance_of(FarMar::Product)
        expect(all_products[-1]).to be_an_instance_of(FarMar::Product)
        expect(all_products[-1].name).to eq("Cruel Beef")
      end
    end

    describe ".find(id)" do
      it "returns Product object for matching ID" do
        result = FarMar::Product.find(11)
        expect(result).to be_an_instance_of(FarMar::Product)
        expect(result.name).to eq("Gigantic Bread")
        expect(result.vendor_id).to eq(6)
      end
    end

    describe ".by_vendor(vendor_id)" do
      it "returns empty array for an invalid vendor_id" do
        expect(FarMar::Product.by_vendor('a')).to eq([])
        expect(FarMar::Product.by_vendor([1, 2])).to eq([])
        expect(FarMar::Product.by_vendor(-5)).to eq([])
        expect(FarMar::Product.by_vendor(999999999999)).to eq([])
      end

      it "returns all the products with the given vendor_id" do
        products = FarMar::Product.by_vendor(91)
        expect(products).to be_an_instance_of(Array)
        expect(products.length).to eq(3)
        expect(products[-1].id).to eq(285)
      end
    end

    describe ".revenue" do
      it "returns the revenue for a given product" do
        expect(sample_product.revenue).to eq(39719)
      end
    end

    describe ".most_revenue(n)" do
      it "returns an empty array when n is invalid" do
        expect(FarMar::Product.most_revenue(-3)).to eq([])
        expect(FarMar::Product.most_revenue('abc')).to eq([])
        expect(FarMar::Product.most_revenue(9999999999999)).to eq([])
      end
      it "returns the top n products ranked by total revenue" do
        top_revenue = FarMar::Product.most_revenue(1)
        top_five = FarMar::Product.most_revenue(5)
        expect(top_revenue).to be_an_instance_of(Array)
        expect(top_revenue.length).to eq(1)
        expect(top_revenue[0].revenue).to eq(118516)
        expect(top_five).to be_an_instance_of(Array)
        expect(top_five.length).to eq(5)
        expect(top_revenue[-1].revenue).to eq(99098)
      end
    end

    describe "#sales" do
      it "returns array of Sales that match the product id" do
        sales = sample_product.sales
        expect(sales).to be_an_instance_of(Array)
        expect(sales.length).to eq(7)
        expect(sales[0].id).to eq(32)
        expect(sales[-1].id).to eq(38)
      end
    end

    describe "#vendor" do
      it "returns the Vendor associated with this Product" do
        sample_vendor = sample_product.vendor
        expect(sample_vendor).to be_an_instance_of(FarMar::Vendor)
        expect(sample_vendor.id).to eq(sample_product.vendor_id)
        expect(sample_vendor.name).to eq("Bechtelar Inc")
      end
    end

    describe "#number_of_sales" do
      it "returns the number of times the product has been sold" do
        expect(sample_product.number_of_sales).to eq(7)
      end
    end
  end
end
