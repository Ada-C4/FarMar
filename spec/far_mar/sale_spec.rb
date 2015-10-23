require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new(19,9035,"2013-11-11 03:37:15 -0800",4,6)
  end

  describe "Sale.new" do
    it "creates a new instance of a market" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

  describe ".all" do
    it "returns an array" do
      expect(FarMar::Sale.all).to be_an Array
    end
  end

  describe ".find" do
    it "returns a single sale" do
      expect(FarMar::Sale.find(2)).to be_an_instance_of FarMar::Sale
    end

    it "returns a specific vendor" do
      expect(FarMar::Sale.find(2).id).to eq 2
    end
  end

  describe "#vendor" do
    it "returns a specific vendor" do
      expect(@sale.vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "#product" do
    it "returns a specific product" do
      expect(@sale.product).to be_an_instance_of FarMar::Product
    end
  end

  describe ".between" do
    it "returns an array of sales" do
      expect(FarMar::Sale.between(1,2)).to be_an Array
    end
  end

end
