require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new("1", "name", "1")
end


  describe "new product instance" do
    it "creats a new product instance" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end


  describe "return a collection of product instances described in CVS" do
    it "returns all of the accounts" do
      expect(FarMar::Product.all).to be_an_instance_of Array
    end
  end

  describe "return one account" do
    it "returns one account" do
      expect(FarMar::Product.find(1).id).to eq 1
    end
  end

  describe "get_vendor" do
    it "returns all account with the same vendor id" do
      expect(@product.get_vendor).to be_an Array
    end
  end

  describe "number_of_sales" do
    it "returns the number of the product has been sold" do
     expect(@product.number_of_sales).to eq 7
    end
  end

  describe "self.by_vendor" do
    it "returns returns all of the products with the given vendor_id" do
    expect(FarMar::Product.all.find_all)
  end
end

end
