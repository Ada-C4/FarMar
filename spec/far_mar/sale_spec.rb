require "./spec/spec_helper"

describe FarMar::Sale do
  describe "#initialize" do
    it "creates new instance of sale" do
      @sale1 = FarMar::Sale.new
      @sale2 = FarMar::Sale.new
      expect(@sale1).to be_instance_of FarMar::Sale
      expect(@sale2).to be_instance_of FarMar::Sale
    end
  end
end
