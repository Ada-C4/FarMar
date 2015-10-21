require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new("id","name","city","county","state","zip","address")
end

  describe "new market instance" do
    it "creats a new market instance" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end



  describe "return a collection of market instances described in CVS" do
    it "returns all of the accounts" do
      expect(FarMar::Market.all).to be_an_instance_of Array
    end
  end

  describe "return one account" do
    it "returns one account" do
      expect(FarMar::Market.find(1).id).to eq 1
    end
  end

  describe ".get_vendor" do
    it "returns all accounts with same market id" do
      expect(@market.get_vendor).to be_an Array
    end
  end

end
