require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new
  end

  describe "Product.new" do
    it "creates a new instance of a market" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end
end
