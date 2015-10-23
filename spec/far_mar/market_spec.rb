require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new(1, "Meighan's Ranch", "1234 N St", "Seattle", "WA", "King", "98103")
    @market_1 = FarMar::Market.new(1,"People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon","97202")
  end
  describe "#initialize" do
    it "creates a new instance" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end

  describe "self.all" do
    it "creates an array of markets" do
      expect(FarMar::Market.all).to be_an Array
    end
  end

  describe "self.find" do
    it "returns market instance where the value of the id the passed parameter" do
      result = FarMar::Market.find(3)
      expect(result).to be_an Object
      expect(result.market_id).to eq 3
    end
  end

  describe "vendors" do
    it "returns a collection of vendor instances that are associated with market_id" do
      market_vendor_array = @market.vendors
      expect(market_vendor_array).to be_an Array
      expect(market_vendor_array.length).to eq 6
    end
  end

  describe "products" do
    it "returns a collection of product instances via the Vendor class" do
      market_product_array = @market.products
      expect(market_product_array).to be_an Array
      expect(market_product_array[0]).to be_an_instance_of FarMar::Product
    end
  end

  describe "self.search(search_term)" do
    describe "does the search part of the method" do
      it "searches market names" do
        expect(FarMar::Market.find(4).name).to be_a String
        expect(FarMar::Market.find(4).name).to include("Preston")
      end
      it "searches vendor names" do
        expect(FarMar::Vendor.find(2).name).to be_a String
        expect(FarMar::Vendor.find(2).name).to include("Hamill")
      end
    end
    describe "creates a collection of market instances that contain search_term" do
      it "creates a collection of markets from market name search" do
        expect(FarMar::Market.search("People").length).to eq 2
        expect(FarMar::Market.search("People")[0].market_id).to eq 1
      end
      it "creates a collection of markets from vendor name search" do
        expect(FarMar::Market.search("Donnelly").length).to eq 17
        expect(FarMar::Market.search("donnelly")[0].market_id).to eq 3
      end
    end

    describe "preferred_vendor" do
      it "returns the vendor with the highest revenue" do
        expect(@market_1.preferred_vendor).to be_an_instance_of FarMar::Vendor
        expect(@market_1.preferred_vendor.vendor_id).to eq 5
        expect(@market_1.preferred_vendor.revenue).to eq 61749
      end
    end

    describe "preferred_vendor(date)" do
      it "returns the vendor with the highest revenue for the given date" do
        @date = DateTime.strptime("2013-11-07", "%Y-%m-%d")
        expect(@market_1.preferred_vendor("2013-11-07")).to be_an_instance_of FarMar::Vendor
      end
    end

    describe "worst_vendor" do
      it "returns the vendor with the lowest revenue" do
        expect(@market_1.worst_vendor).to be_an_instance_of FarMar::Vendor
        expect(@market_1.worst_vendor.vendor_id).to eq 6
        expect(@market_1.worst_vendor.revenue).to eq 2977
      end
    end
  end
end
