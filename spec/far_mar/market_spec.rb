require "spec_helper"

describe FarMar::Market do
  before :each do
    @market=FarMar::Market.new
  end

  describe "initialize market" do
    it "creat a new market" do
      expect(@market.name).to eq ""
    end
  end
end
