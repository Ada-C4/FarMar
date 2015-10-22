require "spec_helper"

describe FarMar::Market do
  before :each do

    @market = FarMar::Market.new({
      id:       "1",
      name:     "People's Co-op Farmers Market",
      address:  "30th and Burnside",
      city:     "Portland",
      county:   "Multnomah",
      state:    "Oregon",
      zip:      "97202"
    })
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
      csv = CSV.read("support/markets.csv")
      expect(all_markets.length).to eq csv.length
    end
  end

  describe "#find" do
    it "returns the instance of Market matching the input id" do
      expect(FarMar::Market.find(1)).to be_an_instance_of FarMar::Market
      expect(FarMar::Market.find(1).name).to eq "People's Co-op Farmers Market"
    end
  end

  describe ".vendors" do
    it "returns a collection of vendor instances associated with the specific market" do
      expect(@market.vendors).to be_an Array
      expect(@market.vendors.length).to eq 6
    end
  end

  describe ".products" do
    it "returns a collection of product instances associated with the market" do
      expect(@market.products).to be_an Array
      expect(@market.products.length).to eq 13
    end
  end

end
