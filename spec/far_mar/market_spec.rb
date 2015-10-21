require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new({})
    # csv = CSV.read("support/markets.csv")
  end

  describe "initialize" do
    it "creates an instance of a market" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end

  describe "self.all" do
    it "returns an array or all the markets" do
      expect(FarMar::Market.all.length).to eq 500
    end

    it "reads values correctly" do
      expect(FarMar::Market.all()[24].state).to eq "Illinois"
    end
  end

  describe "self.find" do
    it "returns a market given an id" do
      expect(FarMar::Market.find(4).name).to eq "Preston Farmers’ Market"
    end
  end

  describe "#vendors" do
    before :each do
      @market1 = FarMar::Market.find(1)
      @vendor1 = FarMar::Vendor.find(1)
    end
    it "returns list of matched vendors to id" do
      expect(@market1.vendors).to include @vendor1
    end
  end
end
