require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new("id", "amount", "purchase_time", "vendor_id", "product_id")
end

  describe "new sale instance" do
    it "creats a new sale instance" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end
  describe "return a collection of sale instances described in CVS" do
    it "returns all of the accounts" do
      expect(FarMar::Sale.all).to be_an_instance_of Array
    end
  end

  describe "return one account" do
    it "returns one account" do
      expect(FarMar::Sale.find(1).id).to eq 1
    end
  end

  describe "get_vendor" do
    it "returns vendor instance ralated to sale" do
      expect(@sale.get_vendor).to be_an Array
      end
    end

  describe "get_product" do
    it "returns product instance related to sale" do
      expect(@sale.get_product). to be_an Array
    end
  end

end
