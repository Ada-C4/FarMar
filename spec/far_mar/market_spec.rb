require "spec_helper"

describe FarMar::Market do
    before :each do
      @market = FarMar::Market.new("1", "Test Market", "123 Spring St", "Seattle", "King", "WA", "98103")
      @all_markets = FarMar::Market.all
    end
    describe ".new" do
      it "creates a new instance of market" do
        expect(@market).to be_an_instance_of FarMar::Market
      end
    end
    describe "#id" do
      it "returns unique id for the market" do
        expect(@market.id).to eq 1
      end
    end
    describe "#name" do
      it "returns name for the market" do
        expect(@market.name).to eq "Test Market"
      end
    end
    describe "#address" do
      it "returns the address focr the market" do
        expect(@market.address).to eq "123 Spring St"
      end
    end
    describe "#city" do
      it "returns the city for the market" do
        expect(@market.city).to eq "Seattle"
      end
    end
    describe "#county" do
      it "returns the county for the market" do
        expect(@market.county).to eq "King"
      end
    end
    describe "#state" do
      it "returns the state for the market" do
        expect(@market.state).to eq "WA"
      end
    end
    describe "#zip" do
      it "returns the zip code for the market" do
        expect(@market.zip).to eq "98103"
      end
    end
    describe "self.all" do
      it "creates an array" do
        expect(@all_markets).to be_an Array
      end
      it "elements are instances of FarMar::Market" do
        expect(@all_markets[0]).to be_an_instance_of FarMar::Market
      end
      it "creates an market for each row in the csv file" do
        expect(@all_markets.length).to eq 500
      end
    end
    describe "self.find(id)" do
      it "returns an instance of market with the passed id" do
        market_15 = FarMar::Market.find(15)
        expect(market_15).to be_an_instance_of FarMar::Market
        expect(market_15.id).to eq 15
      end
    end
    describe "#vendors" do
      it "returns a collection of vendor instances associated with the market id" do
        expect(@market.vendors).to be_an Array
        expect(@market.vendors[3]).to be_an_instance_of FarMar::Vendor
        expect(@market.vendors[4].market_id).to eq 1
    end
  end
end
