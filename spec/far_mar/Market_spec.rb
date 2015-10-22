require 'spec_helper'
describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new("500", "Montefiore Medical Center Farmers Market_Thursday", "111 E. 210th Street", "Bronx", "Bronx", "New York", "10467")
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
  describe ".vendors" do
    it "returns collection of all vendor instances with market_id matching market instance's id" do
      expect(@market.vendors.length).to eq 10
    end
    it "returns a collection of vendor instances" do
      expect(@market.vendors[0].class).to eq FarMar::Vendor
    end
  end
  describe ".products" do
    it "returns a collection of product instances associated through vendors" do
      #vendor ids: 2681, 2682, 2683, 2684, 2685, 2686, 2687, 2688, 2689, 2690
      expect(@market.products.length).to eq 34
      expect(@market.products[0].class).to eq FarMar::Product
    end
  end
  
end
