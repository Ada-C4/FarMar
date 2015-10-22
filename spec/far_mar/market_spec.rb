require "./spec/spec_helper"

describe FarMar::Market do
  describe "initialize" do
    before :each do
      @market = FarMar::Market.new(1, "People's Co-op Farmers Market", "30th and Burnside", "Portland", "Multnomah", "Oregon", "97202")
      @market2 = FarMar::Market.new(54, "Crescent City Farmers Market", "1 South Summit Street", "Crescent City", "Putnam", "Florida", "32112")
    end

    it "creates an instance of Farmar::Market class" do
      expect(@market).to be_an_instance_of FarMar::Market
    end

    describe "#self.all" do
      it "returns an Array" do
        expect(FarMar::Market.all).to be_an Array
      end
      it "returns all 500 instances in csv file" do
        expect(FarMar::Market.all.length).to eq 500
      end
      it "returns instances of FarMar::Market" do
        expect(FarMar::Market.all[0].id).to eq 1
        expect(FarMar::Market.all[0].name).to eq "People's Co-op Farmers Market"
        expect(FarMar::Market.all[0].address).to eq "30th and Burnside"
      end
    end

    describe "#self.find" do
      it "returns the FarMar::Market with the specified id" do
        expect(FarMar::Market.find(2)).to be_an_instance_of FarMar::Market
        expect(FarMar::Market.find(2).name).to eq "Silverdale Farmers Market"
      end
    end

    describe "#vendors" do
      it "returns all Vendors for the specific market instance" do
        expect(@market.vendors).to be_an Array
        expect(@market.vendors.length).to eq 6
        expect(@market.vendors[0].name).to eq "Feil-Farrell"
      end
    end

    describe "#products" do
      it "returns all Products for the specific market instance" do
        expect(@market.products).to be_an Array
        expect(@market.products.length).to eq 13
        expect(@market.products[1].name).to eq "Fierce Greens"
      end
    end

    describe "#self.search(search_term)" do
      it "returns all Markets where the market or vendor name contain the search term" do
        expect(FarMar::Market.search("School").length).to eq 3
        expect(FarMar::Market.search("School")[0].id). to eq 75
      end
    end

    describe "#preferred_vendor" do
      it "returns the vendor with the highest revenue" do
        expect(@market.preferred_vendor.name).to eq "Reynolds, Schmitt and Klocko"
        expect(@market2.preferred_vendor.name).to eq "Denesik and Sons"
      end
    end
  end
end
