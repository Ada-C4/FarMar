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
        new_market = FarMar::Market.new(fake_hash)
        expect(new_market).to be_an_instance_of(FarMar::Market)
        expect(new_market.id).to eq(1)
        expect(new_market.name).to eq("Holiday")
        expect(new_market.zip).to eq("98133")

        # I tried to iterate over the original hash but that was a fail.
        # fake_hash.each do |k, v|
        #   expect(new_market.k.to_s).to eq(v)
        # end
      end
    end

    describe ".all" do
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
