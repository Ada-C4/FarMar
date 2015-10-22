require 'spec_helper'

describe FarMar do
  describe FarMar::Market do
    market_hash = FarMar::Market.convert_to_hash(["64","Oakmont Farmers Market","1 W Eagle Road","Havertown","Delaware","Pennsylvania","19083"])
    let(:sample_market) { FarMar::Market.new(market_hash)}
    describe "#initialize" do
      it "creates a new Market instance" do
        expect(sample_market).to be_an_instance_of(FarMar::Market)
        expect(sample_market.id).to eq(64)
        expect(sample_market.name).to eq("Oakmont Farmers Market")
        expect(sample_market.zip).to eq("19083")

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

    describe ".find(id)" do
      it "returns nil when id is not an integer" do
        expect(FarMar::Market.find('a')).to be_nil
        expect(FarMar::Market.find([1, 2])).to be_nil
      end
      it "returns nil for no matching id" do
        expect(FarMar::Market.find(9999999999999)).to be_nil
        expect(FarMar::Market.find(-1)).to be_nil
      end

      it "returns Market object for matching id" do
        result = FarMar::Market.find(18)
        expect(result).to be_an_instance_of(FarMar::Market)
        expect(result.name).to eq("Grand Valley State University Farmers Market")
      end
    end

    describe "#vendors" do
      let(:sample_market) {
        FarMar::Market.new({
          :id => 20,
          :name => "Scottdale Farmers Market",
          :address => "1 Centennial Way",
          :city => "Scottdale",
          :county => "Westmoreland",
          :state => "Pennsylvania",
          :zip => "15683" })
        }
      it "returns array of vendors for the market" do
        vendors = sample_market.vendors
        expect(vendors).to be_an(Array)
        expect(vendors.length).to eq(7)
        expect(vendors[-1]).to be_an_instance_of(FarMar::Vendor)
        expect(vendors[0].name).to eq("Davis Group")
      end
    end
  end
end
