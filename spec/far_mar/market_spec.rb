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
      @market2 = FarMar::Market.new("", "Best Market","","","","","45555")
      expect(@market2.name).to eq "Best Market"
      expect(@market2.zip).to eq "45555"
    end
  end

  describe "self.all" do
    it "creates a collection of market objects from csv" do
      all = FarMar::Market.all("./support/markets.csv")
      my_csv = CSV.read("./support/markets.csv")
      expect(all.length).to eq my_csv.length
      expect(all).to be_an_instance_of Array
    end

  end


end
