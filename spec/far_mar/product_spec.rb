require "spec_helper"

describe FarMar do
  describe FarMar::Product do
    describe "initialize" do
      it "creates an instance of a Product" do
        @product_hash = {
        :id => 123,
        :name => "product name",
        :vendor_id => 456
        }
        expect(FarMar::Product.new(@product_hash)).to be_an_instance_of FarMar::Product
      end
    end

      describe "self.all" do
        it "returns an array" do
          expect(FarMar::Product.all).to be_an Array
        end
      end

      describe "self.find" do
        it "returns an instance of product" do
          num = rand(1..8193)
          expect(FarMar::Product.find(num)).to be_an_instance_of FarMar::Product
        end
        it "returns an instance of product with the correct ID" do
          num = 1
          product = FarMar::Product.find(num)
          expect(product.id).to eq 1
        end
    end
  end
end
