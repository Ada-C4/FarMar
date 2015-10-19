require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale =FarMar::Sale.new
  end

  describe "initialize Sale" do
    it "creat a new sale" do
      expect(@sale.amount).to eq 3
    end
  end
end
