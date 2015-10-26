require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new(1, "Bob", "123 Street", "Seattle", "King", "WA", "98103")
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
      twelve = FarMar::Market.find(12)
    expect(twelve).to be_an_instance_of FarMar::Market
    expect(twelve.id).to eq 12
    end
  end

  describe "vendors" do
    it "returns the number of vendors that have a specified market ID" do
    expect(@market.vendors.length).to eq 6
    end
  end

end
