require "./spec/spec_helper"

describe FarMar::Sale do
  before :each do
    @sale1 = FarMar::Sale.new(5, "amount", "2013-11-06 22:57:35 -0800", "vendor_id", "product_id")
    @sale2 = FarMar::Sale.new(6, "amount", "2013-11-06 22:57:35 -0805", "vendor_id", "product_id")
  end
  describe "#initialize" do
    it "creates new instance of sale" do
      expect(@sale1).to be_instance_of FarMar::Sale
      expect(@sale2).to be_instance_of FarMar::Sale
    end
  end
  describe "#self.all" do
    it "returns an array" do
      expect(FarMar::Sale.all).to be_an Array
    end
    it "returns 12798 items in array" do
      expect(FarMar::Sale.all.length).to eq 12798
    end
  end
  describe "#self.find(id)" do
    it "returns an instance of FarMar::Sale" do
      expect(FarMar::Sale.find(1)).to be_instance_of FarMar::Sale
    end
    it "returns correct instance of FarMar::Sale" do
      expect(FarMar::Sale.find(1).amount).to eq 9290
      expect(FarMar::Sale.find(2).amount).to eq 2262
    end
  end
end
