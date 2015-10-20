require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new
  end

  context "initializing" do
    it "returns a product object" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end
end
