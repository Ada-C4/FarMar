require "spec_helper"
describe FarMar do
  describe FarMar::Market do

    describe ".new" do
      before :each do
        @market = FarMar::Market.new
      end
      it "creates a new instance of the Market class" do
        expect(@market).to be_an_instance_of(FarMar::Market)
      end
    end

    describe ".all" do
      before :each do
        @markets = CSV.read("./support/markets.csv")
      end
      it "returns an array" do
        expect(FarMar::Market.all).to be_an(Array)
      end
      it "returns an array with the vendor info" do
        expect(FarMar::Market.all.length).to eq(@markets.size)
      end
    end

  end
end
