require 'spec_helper'

describe FarMar do
  describe FarMar::Market do
    describe "#initialize" do
      it "creates a new Market instance" do
        expect(FarMar::Market.new()).to be_an_instance_of(FarMar::Market)
      end
    end

    describe ".all" do
      before :each do
        all_markets = FarMar::Market.all
      end
      it "returns an array of Market objects" do
        expect(all_markets).to be_an(Array)
        expect(all_markets[0]).to be_an_instance_of(FarMar::Market)
        expect(all_markets[-1]).to be_an_instance_of(FarMar::Market)
        expect(all_markets.length).to eq(500)
      end
    end
  end
end
