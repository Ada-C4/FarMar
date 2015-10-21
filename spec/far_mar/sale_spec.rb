require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new(14, 4978, "2013-11-10 01:51:24 -0800", 3, 4)
  end

  context "initializing" do
    it "returns a sale object" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

  context "#self.all" do
    it "only returns instances in the sales.csv file" do
      expect(FarMar::Sale.all()).to be_truthy
    end
  end
end
