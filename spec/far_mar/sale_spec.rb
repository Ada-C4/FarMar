require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale1 = FarMar::Sale.new(:id =>1, :amount =>9290, :purchase_time =>"2013-11-07 04:34:56 -0800", :vendor_id => 1, :product_id => 1)
  end
  
  describe "initialize" do
    it "creates an instance of a sale" do
      expect(@sale1).to be_an_instance_of FarMar::Sale
    end
  end

  describe "self.all" do
    it "returns an array or all the sales" do
      expect(FarMar::Sale.all.length).to eq 12798
    end
  end

  describe "self.find" do
    it "returns a sale given an id" do
      expect(FarMar::Sale.find(4).amount).to eq 1634
    end
  end

  describe "#vendor" do
    it "returns a vendor" do
      expect(@sale1.vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "#product" do
    it "returns a product" do
      expect(@sale1.product).to be_an_instance_of FarMar::Product
    end
  end
end
