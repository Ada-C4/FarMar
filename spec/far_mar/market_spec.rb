require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new("14", "Hartford Farmers Market", "1 Block North of Highway 60 on Rural Street","Hartford","Washington", "Wisconsin", "53027")
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
    it "returns an instance with a specific id" do
      expect(FarMar::Market.find(14)).to be_truthy
    end
  end

  # context "" do
  #   it "" do
  #     expect().to
  #   end
  # end
end
