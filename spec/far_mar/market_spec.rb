require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new
end

  describe "new market instance" do
    it "creats a new market instance" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end
end
