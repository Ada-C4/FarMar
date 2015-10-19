require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new("pounds")
  end

  describe "self.new(name)" do
    it "creates a new instance of Market" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end
end
