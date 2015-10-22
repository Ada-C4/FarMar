require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new(1,2,3)
  end

  describe "Product.new" do
    it "creates a new instance of a market" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

  describe ".all" do
    it "returns an array" do
      expect(FarMar::Product.all).to be_an Array
    end
  end

  describe ".find" do
    it "returns a single vendor" do
      expect(FarMar::Product.find(2)).to be_an_instance_of FarMar::Product
    end

    it "returns a specific vendor" do
      expect(FarMar::Product.find(2).id).to eq 2
    end
  end

  describe "#vendor" do
    it "returns a single vendor" do
      expect(@product.vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "#sales" do
    it "returns an array of sales" do
      expect(@product.sales).to be_an Array
    end
  end

  describe "#number_of_sales" do
    it "returns number of times the product has been sold" do
      expect(@product.number_of_sales).to be >= 0
    end
  end

  describe ".by_vendor" do
    it "returns an array" do
      expect(FarMar::Product.by_vendor(1)).to be_an Array
    end
  end


end
