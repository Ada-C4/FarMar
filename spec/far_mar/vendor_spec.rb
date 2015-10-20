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
    it "returns an instance of FarMar::Vendor" do
      expect(FarMar::Vendor.find(1)).to be_instance_of FarMar::Vendor
      expect(FarMar::Vendor.find(2)).to be_instance_of FarMar::Vendor
    end
    it "returns correct instance of FarMar::Market" do
      expect(FarMar::Vendor.find(1).name).to eq "Feil-Farrell"
      expect(FarMar::Vendor.find(2).name).to eq "Hamill, Kilback and Pfeffer"
    end
  end
  describe "#market" do
    it "returns instance of Market class" do
      expect(@vendor1.market).to be_instance_of FarMar::Market
    end
    it "returns correct instance of Market class" do
      expect(@vendor1.market.name).to eq "Charlestown Farmers Market"
      expect(@vendor2.market.name).to eq "Saratoga Farmers' Market"
    end
  end
  describe "#products" do
    it "returns an array" do
      expect(@vendor1.products).to be_an Array
    end
    it "returns array of correct length" do
      expect(@vendor1.products.length).to eq 3
      expect(@vendor2.products.length).to eq 3
    end
    it "returns correct first item in array" do
      expect(@vendor1.products[0].name).to eq "Shaky Honey"
      expect(@vendor2.products[0].name).to eq "Gigantic Bread"
    end
  end
  describe "#sales" do
    it "returns an array" do
      expect(@vendor1.sales).to be_an Array
    end
    it "returns array of correct length" do
      expect(@vendor1.sales.length).to eq 9
      expect(@vendor2.sales.length).to eq 1
    end
  end
end
