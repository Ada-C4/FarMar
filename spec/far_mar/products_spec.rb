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

      describe "self.find"
      it "returns the information for a given product ID" do
        expect(FarMar::Product.find_product(10)).to eq ["10", "Black Apples", "5"]
        end

end
