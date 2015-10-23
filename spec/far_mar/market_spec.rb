require "spec_helper"

describe FarMar::Market do
    before :each do
      @market = FarMar::Market.new("1", "Test Market", "123 Spring St", "Seattle", "King", "WA", "98103")
      @all_markets = FarMar::Market.all
    end
    describe ".new" do
      it "creates a new instance of market" do
        expect(@market).to be_an_instance_of FarMar::Market
      end
    end
    describe "#id" do
      it "returns unique id for the market" do
        expect(@market.id).to eq 1
      end
    end
    describe "#name" do
      it "returns name for the market" do
        expect(@market.name).to eq "Test Market"
      end
    end
    describe "#address" do
      it "returns the address for the market" do
        expect(@market.address).to eq "123 Spring St"
      end
    end
    describe "#city" do
      it "returns the city for the market" do
        expect(@market.city).to eq "Seattle"
      end
    end
    describe "#county" do
      it "returns the county for the market" do
        expect(@market.county).to eq "King"
      end
    end
    describe "#state" do
      it "returns the state for the market" do
        expect(@market.state).to eq "WA"
      end
    end
    describe "#zip" do
      it "returns the zip code for the market" do
        expect(@market.zip).to eq "98103"
      end
    end
    describe "self.all" do
      it "creates an array" do
        expect(@all_markets).to be_an Array
      end
      it "elements are instances of FarMar::Market" do
        expect(@all_markets[0]).to be_an_instance_of FarMar::Market
      end
      it "creates an market for each row in the csv file" do
        expect(@all_markets.length).to eq 500
      end
    end
    describe "self.find(id)" do
      it "returns an instance of market with the passed id" do
        market_15 = FarMar::Market.find(15)
        expect(market_15).to be_an_instance_of FarMar::Market
        expect(market_15.id).to eq 15
      end
    end
    describe "#vendors" do
      it "returns a collection of vendor instances associated with the market id" do
        expect(@market.vendors).to be_an Array
        expect(@market.vendors[3]).to be_an_instance_of FarMar::Vendor
        expect(@market.vendors[4].market_id).to eq 1
    end
  end
  describe "#products" do
    it "returns a collection of products sold at the market" do
      market = FarMar::Market.new("26","Cheyenne Farmers Market","1 Depot Plaza","Cheyenne","Laramie","Wyoming","82001")
      products_26 = market.products
      expect(products_26).to be_an Array
      expect(products_26[2]).to be_an_instance_of(FarMar::Product)
      expect(products_26[1].vendor.market.id).to eq 26
    end
  end
  describe "self.search(search_term)" do
    it "returns market instances with search term in the market or vendor name" do
      expect(FarMar::Market.search('school').length).to eq 3
      expect(FarMar::Market.search('school').include?(FarMar::Market.find(75))).to be_truthy
      expect(FarMar::Market.search('Sons').length).to eq 220
      expect(FarMar::Market.search('sons').include?(FarMar::Market.find(269))).to be_truthy
    end
  end
  describe "#prefered_vendor" do
    it "returns the vendor at the market with highest revenue" do
      market_1 = FarMar::Market.new("1","People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon","97202")
      expect(market_1.prefered_vendor).to be_an_instance_of FarMar::Vendor
      expect(market_1.prefered_vendor.id).to eq 5
      expect(market_1.prefered_vendor.revenue).to eq 61749
    end
  end
  describe "#prefered(date)" do
    it "returns the vendor with the highest revenue for the given date" do
    market_4 = FarMar::Market.new("4","Preston Farmers’ Market","#1 Route 164","Preston","New London","Connecticut","")
    expect(market_4.prefered_vendor("2013-11-10")).to be_an_instance_of FarMar::Vendor
    expect(market_4.prefered_vendor("2013-11-10").id).to be 15
    end
  end
  describe "#worst_vendor" do
    it "returns the vendor at the market with lowest revenue" do
      market_20 = FarMar::Market.new("20","Scottdale Farmers Market","1 Centennial Way","Scottdale","Westmoreland","Pennsylvania","15683")
      expect(market_20.worst_vendor).to be_an_instance_of FarMar::Vendor
      expect(market_20.worst_vendor.id).to eq 105
      expect(market_20.worst_vendor.revenue).to eq 1810
    end
  end
  describe "#worst_vendor(date)" do
    it "returns the vendor with the lowest revenue for the given date" do
    market_4 = FarMar::Market.new("4","Preston Farmers’ Market","#1 Route 164","Preston","New London","Connecticut","")
    expect(market_4.worst_vendor("2013-11-10")).to be_an_instance_of FarMar::Vendor
    expect(market_4.worst_vendor("2013-11-10").id).to be 14
    end
  end


end
