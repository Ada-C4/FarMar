require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new
  end

  describe ".new" do
    it "creates a new instance of a market" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end

  #here put a test where we see if we can make a farmers market
end
