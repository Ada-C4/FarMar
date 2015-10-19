require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new
  end
  describe ".new" do
    it "creates a new instance of product" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end
end
