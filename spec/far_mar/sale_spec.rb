require "spec_helper"

describe FarMar::Sale do
  describe "initialize" do
    it "creates an instance of a sale" do
      expect(FarMar::Sale.new({})).to be_an_instance_of FarMar::Sale
    end
  end

  describe "self.all" do
    it "returns an array or all the sales" do
      expect(FarMar::Sale.all.length).to eq 12798
    end
  end

  describe "self.find" do
    it "returns a sale given an id" do
      expect(FarMar::Sale.find(4).amount).to eq "1634"
    end
  end
end
