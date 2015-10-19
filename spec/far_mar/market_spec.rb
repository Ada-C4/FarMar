require "spec_helper"

describe Farmer::Market do
  before :each do
    @market = Farmer::Market.new
  end

  context "initializing" do
    it "returns a market object" do
      expect(@market).to be_an_instance_of Farmer::Market
    end
  end
end
