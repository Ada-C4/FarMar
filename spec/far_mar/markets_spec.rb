require "./spec/spec_helper.rb"
require "./lib/far_mar/market_class.rb"

describe FarMar::Market do

  describe "initialize"
  before :each do
    @market_test = FarMar::Market.new
  end
    it "creates a new instace of the market class" do
      expect(@market_test).to be_an_instance_of FarMar::Market
    end
    it "converts the csv file to an array" do
      expect(@market_test.market_array).to be_an Array
    end

    describe "self.all"
      it "returns an array of all markets in the csv file" do
        expect(FarMar::Market.all.length).to eq 500
      end
end
