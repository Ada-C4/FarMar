require 'spec_helper'
describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new("1", "9290", "2013-11-07 04:34:56 -0800", "1", "1")
  end
  describe "#new" do
    it "creates a new Sale instance" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end
  describe "#all" do
    it "creates new Sale instances" do
      expect(FarMar::Sale.all[1].amount).to eq 2262
    end
    it "returns a collection representing all sales in the CSV" do
      expect(FarMar::Sale.all.length).to eq 12798
    end
  end
  describe "#find(id)" do
    it "returns the sales instance with an id matching the parameter" do
      expect(FarMar::Sale.find(20).id).to eq 20
    end
  end
end
