require "spec_helper"

describe FarMar::Product do
  before :each do
    @product=FarMar::Product.new(8, "Shaky Honey", 5)
  end

  describe "initialize Product" do
    it "creat a new product" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

  describe ".all" do
    it "returns a collection of Product instances" do
      expect(FarMar::Product.all).to be_an(Array)
    end
  end

  describe "find" do
    it "return the product, usind id " do
      expect(FarMar::Product.find(8).name).to eq("Shaky Honey")
    end
  end
  
end
