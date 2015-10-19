require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new
  end

  describe "#new" do
    it "create a new instance of Market" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end
end
