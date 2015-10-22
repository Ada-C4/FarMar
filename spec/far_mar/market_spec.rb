require "spec_helper"

describe FarMar::Market do

  describe ".new" do
    before :each do
      @market = FarMar::Market.new
    end

    it "creates a new instance of a market" do
      expect(@market).to be_an_instance_of FarMar::Market
    end

    it "by default assigns empty strings to instance variables" do
      expect(@market.name).to eq ""
      expect(@market.address).to eq ""
    end

    it "accepts parameters passed in" do
      @market2 = FarMar::Market.new("3", "Best Market","","","","","45555")
      expect(@market2.name).to eq "Best Market"
      expect(@market2.zip).to eq "45555"
    end
  end

  describe "self.all" do
    context "default csv is passed in" do
      it "creates an array of market objects from default csv" do
        all = FarMar::Market.all
        my_csv = CSV.read("./support/markets.csv")
        expect(all.length).to eq my_csv.length
        expect(all).to be_an(Array)
        expect(all[0].class).to eq FarMar::Market
        expect(all[11].zip).to eq "12051"
      end
    end

    context "non-default csv is passed in" do
      it "creates an array of market objects from default csv" do
        all = FarMar::Market.all("./support/markets2.csv")
        my_csv = CSV.read("./support/markets2.csv")
        expect(all.length).to eq my_csv.length
        expect(all).to be_an_instance_of Array
        expect(all[0].class).to eq FarMar::Market
        expect(all[9].state).to eq "New Dork"
      end
    end
  end

  describe "self.find" do
    context "default csv is passed in" do
      it "returns an instance of a market matching the passed id" do
        id4 = FarMar::Market.find(4)
        id370 = FarMar::Market.find(370)
        expect(id4.county).to eq "New London"
        expect(id4.class).to eq FarMar::Market
        expect(id370.state).to eq "Illinois"
      end
    end

    context "non-default csv is passed in" do
      it "returns an instance of a market matching the passed id" do
        id4 = FarMar::Market.find(4, "./support/markets2.csv")
        expect(id4.county).to eq "New Fundon"
        expect(id4.class).to eq FarMar::Market
      end
    end
  end

  #as smaller csv named vendors2.csv proved acceptable in previous tests, use it for this test as well, for the sake of decreasing test time
  describe "#vendors" do
    it "returns an array of vendor instances with the associated market id" do
      @market3 = FarMar::Market.new("3", "Best Market","","","","","45555")
      vendor_matches = @market3.vendors("./support/vendors2.csv")
      expect(vendor_matches).to be_an(Array)
      expect(vendor_matches[0].market_id).to eq "3"
      expect(vendor_matches[0].name).to eq "New Guy"
    end
  end
end
