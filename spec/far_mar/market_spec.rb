# Wherever I was when I ran RSpec, look inside that directory. When running RSpec, the require knows to look inside the spec folder...
require "spec_helper"

describe FarMar::Market do
  before :each do
    row = [1,"Name", "Address", "City", "County", "State", "Zip"]
    @market = FarMar::Market.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
  end
  describe ".new" do
    it "creates a new instance of Market" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end
  describe "#initialize" do
    it "creates instance variables" do
      expect(@market.instance_variables.length).to eq 7
    end
    it "creates @id as an integer" do
      expect(@market.id.class).to eq Fixnum
    end
  end
  describe "self.all" do
    it "returns an array of all Market instances" do
      expect(FarMar::Market.all).to be_an Array
      expect(FarMar::Market.all.length).to eq 500
    end
  end
  describe "self.find(id)" do
    it "finds a market using its ID" do
      @id = 400
      expect(FarMar::Market.find(@id).name).to eq "Green Spring Station Farmers Market"
    end
  end
  describe "#vendors" do
    it "returns an array of vendors for a particular market" do
      @id = 1
      @market = FarMar::Market.find(@id)
      expect(@market.vendors).to be_an Array
      expect(@market.vendors.length).to eq 6
      expect(@market.vendors[0]).to be_an_instance_of FarMar::Vendor
    end
  end
end
