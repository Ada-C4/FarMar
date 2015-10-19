require "spec_helper"

describe "creating a market class" do
  before :each do
    @market = FarMar::Market.new
  end

  context "initializing" do
    it "returns a market object" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end
end