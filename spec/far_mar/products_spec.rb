require "./spec/spec_helper.rb"
require "./lib/far_mar/product_class.rb"

describe FarMar::Product do
  describe "initialize"

    describe "initialize"
      it "creates a new instace of the product class" do
        @product_test = FarMar::Product.new(0, "name", 12345)
        expect(@product_test).to be_an_instance_of FarMar::Product
      end


    describe "self.all"
      it "returns an array" do
        expect(FarMar::Product.all).to be_an Array
      end
      it "returns all markets in the csv file" do
        expect(FarMar::Product.all.count).to eq 500
      end

    describe "self.find_product"
      it "returns the information for a given product ID" do
        expect(FarMar::Product.find_product(10)).to be_an_instance_of FarMar::Product
        end
      it "returns the instance for the given product ID" do
        @product_test = FarMar::Product.find_product(10)
        expect(@product_test.vendor_id).to eq "5"
        end

      describe "vendor"
        it "returns an instance of vendor" do
          @product_test = FarMar::Product.new("24", "Fierce Beef", "10")
          expect(@product_test.vendor(24)).to be_an_instance_of FarMar::Vendor
        end

      describe "sale"
        it "returns an instance of sale" do
          @prod_test = FarMar::Product.new("4", "Yummy Fruit", "3")
          expect(@prod_test.sales(4)[0]).to be_an_instance_of FarMar::Sale
        end




end
