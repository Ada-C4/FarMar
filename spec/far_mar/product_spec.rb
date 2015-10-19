require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = Product.new
  end

  describe "initialize Product" do
    it "creat a new product" do
      expect(@@product.name).to be_a(String)
    end
  end
end
