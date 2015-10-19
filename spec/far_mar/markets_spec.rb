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
end
