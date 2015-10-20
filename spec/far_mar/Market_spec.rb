require 'spec_helper'
describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new("1", "People's Co-op Farmers Market", "30th and Burnside", "Portland", "Multnomah", "Oregon", "97202")
  end
  describe "#new" do
    it "creates a new Market instance" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end
  describe "#all" do
    it "creates new Market instances" do
      expect(FarMar::Market.all[0].id).to eq 1
    end
    it "returns a collection representing all the markets in the CSV" do
      expect(FarMar::Market.all.length).to eq 500
    end
  end
  describe "#find(id)" do
    it "returns the market instance with an id matching the parameter" do
      expect(FarMar::Market.find(9).id).to eq 9
    end
  end
end
