require "./spec/spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new(1, 9290, "2013-11-07 04:34:56 -0800", 1, 1)
    @sale2 = FarMar::Sale.new(175, 5824, "2013-11-07 21:51:51 -0800", 34, 105)
  end
  
  describe "initialize" do
    it "creates an instance of Farmar::Sale class" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

  describe "#self.all" do
    it "returns an Array" do
      expect(FarMar::Sale.all).to be_an_instance_of Array
    end
    it "returns all 12001 instances in csv file" do
      expect(FarMar::Sale.all.length).to eq 12798
    end
    it "returns instances of FarMar::Sale" do
      expect(FarMar::Sale.all[0].id).to eq 1
      expect(FarMar::Sale.all[0].amount).to eq 9290
      expect(FarMar::Sale.all[0].vendor_id).to eq 1
    end
  end

  describe "#self.find" do
    it "returns the FarMar::Sale with the specified id" do
      expect(FarMar::Sale.find(2)).to be_an_instance_of FarMar::Sale
      expect(FarMar::Sale.find(2).amount).to eq 2262
    end
  end

  describe "vendor" do
    it "returns the FarMar::Vendor instance that is associated with this sale" do
      expect(@sale.vendor).to be_an_instance_of FarMar::Vendor
      expect(@sale.vendor.id).to eq 1
      expect(@sale2.vendor.id).to eq 34
    end
  end
end
