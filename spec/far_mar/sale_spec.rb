require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale =FarMar::Sale.new
  end

  describe "initialize Sale" do
    it "creat a new sale" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end
end
