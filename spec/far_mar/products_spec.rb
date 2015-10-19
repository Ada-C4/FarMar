require "./spec/spec_helper.rb"
require "./lib/far_mar/product_class.rb"

describe FarMar::Product do
  describe "initialize"
  before :each do
    @product_test = FarMar::Product.new
  end

    it "creates a new instace of the product class" do
      expect(@product_test).to be_an_instance_of FarMar::Product
    end
end
