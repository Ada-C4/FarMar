require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = Sale.new
  end

  describe "initialize Sale" do
    it "creat a new sale" do
      expect(@sale.amount).to be_an(Integer)
    end
  end
end
