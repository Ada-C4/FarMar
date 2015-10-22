require "spec_helper"
describe FarMar do
  describe FarMar::Market do

    before :each do
      market_info = ["1","People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon","97202"]
      @market = FarMar::Market.new(market_info)
    end

    describe "#initialize" do
      it "creates a new instance of the Market class" do
        expect(@market).to be_an_instance_of(FarMar::Market)
      end
      it "retrieves the market ID from the market info array" do
        expect(@market.id).to eq(1)
      end
    end

    describe ".all" do
      before :each do
        @markets = CSV.read("./support/markets.csv")
      end
      it "returns an array" do
        expect(FarMar::Market.all).to be_an(Array)
      end
      it "returns an array with all the markets" do
        expect(FarMar::Market.all.length).to eq(@markets.size)
      end
      it "contains instances of the Market class" do
        market_total = FarMar::Market.all.length
        expect(FarMar::Market.all[0]).to be_an_instance_of(FarMar::Market)
        expect(FarMar::Market.all[market_total - 1]).to be_an_instance_of(FarMar::Market)
        expect(FarMar::Market.all[market_total]).to be nil
      end

      describe ".find(id)" do
        before :each do
          @id = rand(1..500)
        end
        it "returns an instance of Market" do
          expect(FarMar::Market.find(@id)).to be_an_instance_of(FarMar::Market)
        end
        it "returns the Market with the matching id" do
          expect(FarMar::Market.find(@id).id).to eq(@id)
        end
      end

      describe "#vendors" do
        it "returns a collection" do
          expect(@market.vendors).to be_an(Array)
        end
        it "returns instances of Vendors" do
          expect(@market.vendors[0]).to be_an_instance_of(FarMar::Vendor) if @market.vendors.length > 0
        end
      end

      describe "#products" do
        it "returns a collection" do
          expect(@market.products).to be_an(Array)
        end
        it "returns instances of Products" do
          expect(@market.products[0]).to be_an_instance_of(FarMar::Product) if @market.products.length > 0
        end
        it "contains Products from Vendors at that Market" do
          expect(@market.products[0].vendor_id).to eq(@market.id) if @market.products.length > 0
        end
      end

      describe ".search(search_term)" do
        before :each do
          @search_term = "school"
        end
        it "returns a collection" do
          expect(FarMar::Market.search(@search_term)).to be_an(Array)
        end
        it "returns the correct number of matches" do
          expect(FarMar::Market.search("school").length).to eq(3)
        end
      end

      describe "#preferred_vendor" do
        it "returns an instance of Vendor" do
          expect(@market.preferred_vendor).to be_an_instance_of(FarMar::Vendor)
        end
        it "returns the Vendor with the most revenue" do
          expect(@market.preferred_vendor.id).to eq(5)
        end
      end

      describe "#preferred_vendor(date)" do
        before :each do
          @date = # some date, how to format??
        end
        it "returns an instance of Vendor" do
          expect(@market.preferred_vendor(@date)).to be_an_instance_of(FarMar::Vendor)
        end
      end

      describe "#worst_vendor" do
        it "returns an instance of Vendor" do
          expect(@market.worst_vendor).to be_an_instance_of(FarMar::Vendor)
        end
        it "returns the Vendor with the most revenue" do
          expect(@market.worst_vendor.id).to eq(6)
        end
      end



    end
  end
end
