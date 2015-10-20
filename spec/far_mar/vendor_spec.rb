require "./spec/spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor1 = FarMar::Vendor.new(5, "name", 7, 8)
    @vendor2 = FarMar::Vendor.new(6, "name", 9, 10)
  end
  describe "#initialize" do
    it "creates new instance of vendor" do
      expect(@vendor1).to be_instance_of FarMar::Vendor
      expect(@vendor2).to be_instance_of FarMar::Vendor
    end
  end

  describe "#self.all" do
    it "returns an array" do
      expect(FarMar::Vendor.all).to be_an Array
    end
    it "returns 2690 items in array" do
      expect(FarMar::Vendor.all.length).to eq 2690
    end
  end
  describe "#self.find(id)" do
    it "returns an instance of FarMar::Market" do
      expect(FarMar::Vendor.find(1)).to be_instance_of FarMar::Vendor
    end
    it "returns correct instance of FarMar::Market" do
      expect(FarMar::Vendor.find(1).name).to eq "Feil-Farrell"
      expect(FarMar::Market.find(2).name).to eq "\"Hamill, Kilback and Pfeffer\""
    end
  end
end
