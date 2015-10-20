require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new(1,"People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon","97202")
  end

  describe ".new" do
    it "creates a new instance of Market" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end

  describe "#all" do
    all_markets = FarMar::Market.all
    it "returns a collection of all market instances in the csv" do
      #test that its an array
      expect(all_markets.class).to eq Array
      #test that some are instances of Market
      expect(all_markets[0]).to be_an_instance_of FarMar::Market
      expect(all_markets[-1]).to be_an_instance_of FarMar::Market
      #test length of array
      expect(all_markets.length).to eq 500
    end
  end

end
