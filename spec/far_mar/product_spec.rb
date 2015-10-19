require "spec_helper"

describe FarMar::Product do
  describe "initialize" do
    it "creates an instance of a product" do
      expect(FarMar::Product.new).to be_an_instance_of FarMar::Product
    end
  end
end
