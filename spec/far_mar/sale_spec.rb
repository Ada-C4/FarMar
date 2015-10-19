require "spec_helper"

describe FarMar::Sale do
  describe "initialize" do
    it "creates an instance of a market" do
      expect(FarMar::Sale.new).to be_an_instance_of FarMar::Sale
    end
  end
end
