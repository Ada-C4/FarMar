require "spec_helper"
describe FarMar do
  describe FarMar::Market do

    describe "#initialize" do
      before :each do
        market_info = CSV.open("./support/markets.csv", 'r') { |csv| csv.first }
        @market = FarMar::Market.new(market_info)
      end
      it "creates a new instance of the Market class" do
        expect(@market).to be_an_instance_of(FarMar::Market)
      end
      it "retrieves the market ID from the market info array" do
        expect(@market.id).to eq(1)
      end
    end

    describe ".all" do
      before :each do
        @markets = CSV.read("./support/markets.csv")
      end
      it "returns an array" do
        expect(FarMar::Market.all).to be_an(Array)
      end
      it "returns an array with all the markets" do
        expect(FarMar::Market.all.length).to eq(@markets.size)
      end
      it "contains instances of the Market class" do
        market_total = FarMar::Market.all.length
        expect(FarMar::Market.all[0]).to be_an_instance_of(FarMar::Market)
        expect(FarMar::Market.all[market_total - 1]).to be_an_instance_of(FarMar::Market)
        expect(FarMar::Market.all[market_total]).to be nil
      end
    end

  end
end
