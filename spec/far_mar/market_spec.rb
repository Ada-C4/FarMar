require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new
  end
  describe "#initialize" do
    it "creates a new instance" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end
end
