require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new(11,1030,"2013-11-10 18:56:53 -0800",3,4)
  end

  describe "initialize Sale" do
    it "creat a new sale" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

  describe "self.all" do
    it "returns a collection of Sale instances" do
      expect(FarMar::Sale.all).to be_an(Array)
    end
  end
end
