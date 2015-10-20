require "spec_helper"

describe FarMar::Product do
  before :each do
    @product=FarMar::Product.new(3, "prori", 1)
  end

  describe "initialize Product" do
    it "creat a new product" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

  describe "all" do
    it "returns a collection of Product instances" do
      expect(FarMar::Product.all).to be_an(Array)
    end
  end
end
