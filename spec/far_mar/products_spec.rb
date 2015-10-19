require "./spec/spec_helper.rb"

describe FarMar::Products do
  describe "initialize"
    product = Products.new
    it "creates a new instace of the product class" do
      expect(product).to be_an_instance_of Products
    end
end
