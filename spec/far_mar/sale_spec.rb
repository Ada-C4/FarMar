require "./spec/spec_helper"

describe FarMar::Sale do
  before :each do
    @sale1 = FarMar::Sale.new(5,4440,"2013-11-10 05:19:05 -0800",1,1)
    @sale2 = FarMar::Sale.new(100,4573,"2013-11-08 15:18:32 -0800",19,56)
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
  describe "#vendor" do
    it "returns an instance of FarMar::Vendor" do
      expect(@sale1.vendor).to be_instance_of FarMar::Vendor
    end
    it "returns correct instance of FarMar::Vendor" do
      expect(@sale1.vendor.name).to eq "Feil-Farrell"
      expect(@sale2.vendor.name).to eq "Labadie-Tremblay"
    end
  end
end
