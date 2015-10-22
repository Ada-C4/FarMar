require "spec_helper"

describe FarMar::Product do
  describe "initialize" do
    it "creates an instance of a product" do
      expect(FarMar::Product.new({})).to be_an_instance_of FarMar::Product
    end
  end

  describe "self.all" do
    it "returns an array or all the products" do
      expect(FarMar::Product.all.length).to eq 8193
    end
  end

  describe "self.find" do
    it "returns a product given an id" do
      expect(FarMar::Product.find(4).name).to eq "Yummy Fruit"
    end
  end

  
end
