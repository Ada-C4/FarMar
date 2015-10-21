require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new("id", "name", "vendor_id")
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

end
