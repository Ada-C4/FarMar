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

  describe "#vendors" do
    it "does not return nil" do
      sample_market_id = 1
      sample_market = FarMar::Market.find(sample_market_id)
      matched_vendors = FarMar::Vendor.all
      matched_vendors = matched_vendors.find_all { |vendor| vendor.market_id == sample_market_id}
      expect(sample_market.vendors).not_to eq []
    end
    it "returns all vendors associated with market_id" do
      sample_market_id = 1
      matched_vendors = FarMar::Vendor.all
      sample_market = FarMar::Market.find(sample_market_id)
      matched_vendors = matched_vendors.find_all { |vendor| vendor.market_id == sample_market_id}
      expect(sample_market.vendors.length).to eq matched_vendors.length
    end
  end

  describe "#products" do
    it "returns an array with products in it" do
      sample_market = @markets[1]
      expect(sample_market.products).to be_an_instance_of Array
      expect(sample_market.products).not_to eq []
      expect(sample_market.products.length).to eq 9
      expect(sample_market.products[0].product_name).to eq "Stupendous Carrots"
    end
  end
end
