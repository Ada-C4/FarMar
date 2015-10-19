require "./spec/spec_helper"

describe FarMar::Product do
  describe "#initialize" do
    it "creates new instance of product" do
      @product1 = FarMar::Product.new
      @product2 = FarMar::Product.new
      expect(@product1).to be_instance_of FarMar::Product
      expect(@product2).to be_instance_of FarMar::Product
    end
  end
end
