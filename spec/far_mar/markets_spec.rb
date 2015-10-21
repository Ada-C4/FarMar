require "./spec/spec_helper.rb"
require "./lib/far_mar/market_class.rb"

describe FarMar::Market do

  describe "initialize"
    it "creates a new instace of the market class" do
      @market_test = FarMar::Market.new(0, "name", "1234 street", "city", "county", "state", 12345)
      expect(@market_test).to be_an_instance_of FarMar::Market
    end
    it "converts the csv file to an array" do
      @market_test = FarMar::Market.new(0, "name", "1234 street", "city", "county", "state", 12345)
      expect(FarMar::Market.all).to be_an Array
    end

    describe "self.all"
      it "returns an array" do
        expect(FarMar::Market.all).to be_an Array
      end
      it "returns all markets in the csv file" do
        expect(FarMar::Market.all.count).to eq 500
      end

    describe "self.find"
    it "returns the information for a given market ID" do
      expect(FarMar::Market.find_market(303)).to eq ["303", "Madison County Farmers Market", "1022 Cook Avenue", "Huntsville", "Madison", "Alabama", "35804"]
      end

#     describe "vendors"
#     FarMar::Vendor.new
#       it "returns a collection" do
#         expect(@market_test.vendors(1)).to be_an Array
#       end
#       it "returns all vendors for a given market id" do
#         expect(@market_test.vendors(1)).to eq #and array with all of the market 1 vendors
#       end
end
