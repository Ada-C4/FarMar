require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new
  end
  describe ".new" do
    it "creates a new instance of sale" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end
end
