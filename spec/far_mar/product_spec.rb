require "spec_helper"

describe FarMar::Product do
  before :each do
    @product=FarMar::Product.new()
  end

  describe "initialize Product" do
    it "creat a new product" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

  describe "self.all" do
    it "returns a collection of Product instances"
  end
end
