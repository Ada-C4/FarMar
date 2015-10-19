require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new
  end
  describe "#initialize" do
    it "creates a new instance" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end
end
