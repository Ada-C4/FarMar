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
    @market2 = FarMar::Market.new({
      id:       "2",
      name:     "Silverdale Farmers Market",
      address:  "98383",
      city:     "Silverdale",
      county:   "Kitsap",
      state:    "Washington",
      zip:      "98383"
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

  describe "#search(search_term)" do
    it "returns a collection of Market instances where the market or vendor name contain the search term" do
      expect(FarMar::Market.search("school")).to be_an Array
      expect(FarMar::Market.search("school").length).to eq 3
      expect(FarMar::Market.search("schmitt").length).to eq 15
    end
  end

  describe ".preferred_vendor" do
    it "returns the vendor with the highest revenue" do
      expect(@market2.preferred_vendor).to be_an_instance_of FarMar::Vendor
      expect(@market2.preferred_vendor.id).to eq 8
    end
  end

  # describe ".preferred_vendor_date" do
  #   it "returns the vendor with the highest revenue for the given date" do
  #     expect(@market2.preferred_vendor_date("2013-11-07")).to be_an_instance_of FarMar::Vendor
  #     expect(@market2.preferred_vendor_date("2013-11-07").id).to eq 7
  #   end
  # end

  describe ".worst_vendor" do
    it "returns the vendor with the lowest vendor" do
      expect(@market2.worst_vendor).to be_an_instance_of FarMar::Vendor
      expect(@market2.worst_vendor.id).to eq 9
    end
  end


end
