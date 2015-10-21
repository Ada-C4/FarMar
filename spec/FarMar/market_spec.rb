require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new("id", "name", "address", "city", "county", "state", "zip")
  end

  describe "initialize" do
      it "creates a new instance of Market" do
        expect(@market).to be_an_instance_of FarMar::Market
      end
  end

# self.all - returns a collection of Market instances,
# representing all of the markets described in the CSV

  describe "self.all" do
    it "creates an array of instances of the Market class" do
    expect(FarMar::Market.all).to be_an Array
    end
  end

  describe "self.findall" do
    it "returns an ID for a market passed in as a parameter" do
    expect((FarMar::Market.find(12)).to eq market_array
    end
  end
end
