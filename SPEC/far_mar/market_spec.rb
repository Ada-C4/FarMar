require 'spec_helper'

describe FarMar::Market do
  before :each do
    market_hash = {
      id: 1738,
      name: "Newtown",
      address: "123 Fake St. SW",
      city: "Seattle",
      county: "King",
      state: "WA",
      zip: "98146"
    }

    @market = FarMar::Market.new(market_hash)
    end

  describe "self.new" do
    it "creates a new instance of Market" do
      expect(@market).to be_an_instance_of FarMar::Market
    end


    it "has a name property that is equal to what is passed in" do
      expect(@market.name).to eq "Newtown"
    end

    it "knows about its associated data file" do
      expect(@market.market_csv).to eq ("./support/markets.csv")
    end
  end

  describe "self.all" do
    all_markets = FarMar::Market.all
    it "returns an array" do
      expect(all_markets.class).to eq Array
      #test that it is an array
      expect(all_markets[0]).to be_an_instance_of FarMar::Market
      expect(all_markets[-1]).to be_an_instance_of FarMar::Market
      market_csv= CSV.read("./support/markets.csv")
      expect(all_markets.length).to eq (market_csv.length)
       #all markets length to equal csv.length
    end
  end

#returns the instance of Market with matching the input # ID
  describe "self.find(id)" do
    it "returns an instance of FarMar::Market with its passed in id" do
    expect(FarMar::Market.find(1)).to be_an_instance_of FarMar::Market
    expect(FarMar::Market.find(1).name).to eq "People's Co-op Farmers Market"
    end
  end
end
