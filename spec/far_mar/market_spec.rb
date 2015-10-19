require "spec_helper"

describe FarMar::Market do
  before :each do
    @markets = FarMar::Market.all

  end

  describe "#new" do
    it "create a new instance of Market" do
      example_market_hash = {:name => "Test Market", :id => 77, :address => "123 Test Street", :city => "Testland", :county => "Test County", :state => "WV", :zip => "00000"}
      test_market = FarMar::Market.new(example_market_hash)

      expect(test_market).to be_an_instance_of FarMar::Market
    end
  end

  describe ".all" do
    it "creates a market object for every market listed in the datafile" do
      csv = CSV.read("support/markets.csv")
      expect(@markets.length).to eq csv.length
    end
  end

  describe ".find" do
    it "can find a market object with a given ID" do
      test_id = @markets[2].id
      expect(FarMar::Market.find(test_id)).to eq @markets[2]
    end
  end
end
