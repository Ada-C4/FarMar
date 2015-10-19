require 'spec_helper'

describe FarMar do
  describe FarMar::Market do
    describe "#initialize" do
      it "creates a new Market instance" do
        fake_hash = {
          :id => 1,
          :name => "Holiday",
          :address => "118 N 180th St",
          :city => "Shoreline",
          :county => "King County",
          :state => "WA",
          :zip => "98133"
        }
        expect(FarMar::Market.new(fake_hash)).to be_an_instance_of(FarMar::Market)
      end
    end

    describe ".all" do
      # before :each do
      #
      # end
      it "returns an array of 500 Market objects" do
        all_markets = FarMar::Market.all
        expect(all_markets).to be_an(Array)
        expect(all_markets[0]).to be_an_instance_of(FarMar::Market)
        expect(all_markets[-1]).to be_an_instance_of(FarMar::Market)
        expect(all_markets[0].id).to eq(1)
        expect(all_markets[-1].id).to eq(500)
        expect(all_markets.length).to eq(500)
      end
    end
  end
end
