require 'spec_helper'

describe FarMar do
  describe FarMar::Market do
    market_hash = FarMar::Market.convert_to_hash(["64","Oakmont Farmers Market","1 W Eagle Road","Havertown","Delaware","Pennsylvania","19083"])
    let(:sample_market) { FarMar::Market.new(market_hash)}
    let(:sample_market2) { FarMar::Market.new({ :id => 20, :name => "Scottdale Farmers Market", :address => "1 Centennial Way", :city => "Scottdale", :county => "Westmoreland", :state => "Pennsylvania", :zip => "15683" })}
    describe "#initialize" do
      it "creates a new Market instance" do
        expect(sample_market).to be_an_instance_of(FarMar::Market)
      end
      market_hash.each do |attr, val|
        it "assigns the #{attr} attribute correctly" do
          expect(sample_market.instance_variable_get("@#{attr}")).to eq(val)
        end
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
      it "returns array of vendors for the market" do
        vendors = sample_market2.vendors
        expect(vendors).to be_an(Array)
        expect(vendors.length).to eq(7)
        expect(vendors[-1]).to be_an_instance_of(FarMar::Vendor)
        expect(vendors[0].name).to eq("Davis Group")
      end
    end

    describe "#products" do
      it "returns all Products sold in the market" do
        products = sample_market.products
        expect(products).to be_an_instance_of(Array)
        expect(products.length).to eq(4)
        expect(products[0]).to be_an_instance_of(FarMar::Product)
        expect(products[0].id).to eq(1073)
        expect(products[-1].id).to eq(1076)
        products2 = sample_market2.products
        expect(products2.length).to eq(22)
      end
    end

    # Returns the vendor with the highest revenue
    describe "#preferred_vendor" do
      it "returns the market's vendor with the highest revenue" do
        max_vendor1 = sample_market.preferred_vendor
        expect(max_vendor1).to be_an_instance_of(FarMar::Vendor)
        expect(max_vendor1.id).to eq(350)
        max_vendor2 = sample_market2.preferred_vendor
        expect(max_vendor2).to be_an_instance_of(FarMar::Vendor)
        expect(max_vendor2.id).to eq(102)
        expect(max_vendor2.revenue).to eq(44789)
      end
    end

    # Returns the vendor with the lowest revenue
    describe "#worst_vendor" do
      it "returns the market's vendor with the lowest revenue" do
        min_vendor1 = sample_market.worst_vendor
        expect(min_vendor1).to be_an_instance_of(FarMar::Vendor)
        expect(min_vendor1.id).to eq(350)
        min_vendor2 = sample_market2.worst_vendor
        expect(min_vendor2).to be_an_instance_of(FarMar::Vendor)
        expect(min_vendor2.id).to eq(105)
        expect(min_vendor2.revenue).to eq(1810)
      end
    end

    # Returns the vendor with the highest revenue for the given date
    describe "#preferred_vendor(date)" do
      it "returns nil for an invalid date" do
        expect(sample_market.preferred_vendor(123)).to be_nil
        expect(sample_market.preferred_vendor('abc')).to be_nil
      end
      it "returns the vendor with the highest revenue for the given date" do
        date = DateTime.parse("2013-11-12T13:07:19-08:00")
        preferred = sample_market2.preferred_vendor(date)
        expect(preferred).to be_an_instance_of(FarMar::Vendor)
        expect(preferred.id).to eq(104)
      end
    end

    # Returns the vendor with the lowest revenue for the given date
    describe "#worst_vendor_on(date)" do
      it "returns nil for an invalid date" do
        expect(sample_market.worst_vendor_on(123)).to be_nil
        expect(sample_market.worst_vendor_on('abc')).to be_nil
      end
      it "returns the vendor with the highest revenue for the given date" do
        date = DateTime.parse("2013-11-12T13:07:19-08:00")
        worst = sample_market2.worst_vendor_on(date)
        expect(worst).to be_an_instance_of(FarMar::Vendor)
        # NOTE: many different possible with 0: 102, 105, 107
        expect(worst.id).to eq(102)
      end
    end

  end
end
