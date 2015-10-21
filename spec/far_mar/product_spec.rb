require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new(12, "Gorgeous Fish", 6)
  end

  context "initializing" do
    it "returns a product object" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

  context "#self.all" do
    it "only returns instances in the products.csv file" do
      expect(FarMar::Product.all()).to be_truthy
    end
  end
end
