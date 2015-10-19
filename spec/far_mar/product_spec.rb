require "./spec/spec_helper"

describe FarMar::Product do
  before :each do
    @product1 = FarMar::Product.new(5, "name", "vendor_id")
    @product2 = FarMar::Product.new(6, "name", "vendor_id")
  end
  describe "#initialize" do
    it "creates new instance of product" do
      expect(@product1).to be_instance_of FarMar::Product
      expect(@product2).to be_instance_of FarMar::Product
    end
  end
  describe "#self.all" do
    it "returns an array" do
      expect(FarMar::Product.all).to be_an Array
    end
    it "returns 500 items in array" do
      expect(FarMar::Product.all.length).to eq 8193
    end
  end
end
