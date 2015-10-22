require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new(1,2,3,4,5)
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
end
