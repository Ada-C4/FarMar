require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new("14", "Hartford Farmers Market", "1 Block North of Highway 60 on Rural Street","Hartford","Washington", "Wisconsin", "53027")
    @market_2 = FarMar::Market.new("500", "Montefiore Medical Center Farmers Market_Thursday", "111 E. 210th Street", "Bronx", "Bronx", "New York","10467")
  end

  context "initializing" do
    it "returns a market object" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end

  context ".self.all" do
    it "returns an array" do
      expect(FarMar::Market.all().class).to be Array
    end
    it "returns instances of all lines in the csv" do
      expect(FarMar::Market.all().length).to eq 500
    end
  end

  context ".self.find(id)" do
    it "returns an instance of Market" do
      expect(@market.class).to be FarMar::Market
    end

    it "returns an instance with the same id as the value in the CSV file" do
      expect(@market.id).to eq 14
      expect(@market_2.id).to eq 500
    end
  end

  context "#vendors" do
    it "returns a collection" do
      expect(@market.vendors.class).to eq Array
    end
    it "is a collection of Vendor instances in Far::Mar" do
      expect(@market.vendors.length).to eq 8
    end
  end
end
