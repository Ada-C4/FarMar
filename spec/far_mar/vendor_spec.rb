require "./spec/spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new(1, "Feil-Farrell", 8, 1)
  end

  describe "initialize" do
    it "creates an instance of Farmar::Vendor class" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "#self.all" do
    it "returns an Array" do
      expect(FarMar::Vendor.all).to be_an_instance_of Array
    end
    it "returns all 12001 instances in csv file" do
      expect(FarMar::Vendor.all.length).to eq 2690
    end
    it "returns instances of FarMar::Vendor" do
      expect(FarMar::Vendor.all[0].id).to eq 1
      expect(FarMar::Vendor.all[0].name).to eq "Feil-Farrell"
      expect(FarMar::Vendor.all[0].market_id).to eq 1
    end
  end

  describe "#self.find" do
    it "returns the FarMar::Vendor with the specified id" do
      expect(FarMar::Vendor.find(2)).to be_an_instance_of FarMar::Vendor
      expect(FarMar::Vendor.find(2).name).to eq "Hamill, Kilback and Pfeffer"
    end
  end

  describe "#market" do
    it "returns the Market for the specific vendor instance" do
      expect(@vendor.market).to be_an_instance_of FarMar::Market
      expect(@vendor.market.name).to eq "People's Co-op Farmers Market"
    end
  end

  describe "#products" do
    it "returns all Products for the specific vendor instance" do
      expect(@vendor.products.length).to eq 1
      expect(@vendor.products[0].name). to eq "Dry Beets"
    end
  end
end
