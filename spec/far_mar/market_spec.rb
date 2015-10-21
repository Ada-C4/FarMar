require "spec_helper"

describe FarMar do
  describe FarMar::Market do
    before :each do
    end

    describe "initialize" do
      it "creates an instance of a Market" do
        @market_hash = {
        :id => 123,
        :name => "market name",
        :address => "market address",
        :city => "market city",
        :county => "market county",
        :state => "market state",
        :zip => 12345
        }
        expect(FarMar::Market.new(@market_hash)).to be_an_instance_of FarMar::Market
      end
      # it "returns an error if not passed a market_hash" do
      #   @market_array = ["a","b"]
      #   expect(FarMar::Market.new(@market_array)).to raise_error TypeError, "no implicit conversion of Symbol into Integer"
      # end
    end

    describe "self.all" do
      it "returns an array" do
        expect(FarMar::Market.all).to be_an Array
      end
    end

    describe "self.find" do
      # it "takes an integer as an argument" do
      #   expect(FarMar::Market.find(num)).to be_an_instance of FarMar::Market
      # end
      it "returns an instance of market" do
        num = rand(1..500)
        expect(FarMar::Market.find(num)).to be_an_instance_of FarMar::Market
      end
      it "returns an instance of market with the correct ID" do
        num = 1
        market = FarMar::Market.find(num)
        expect(market.id).to eq 1
      end
    end

    describe "id" do
      it "returns the ID of the market" do
        @market = FarMar::Market.new({
        :id => 123,
        :name => "market name",
        :address => "market address",
        :city => "market city",
        :county => "market county",
        :state => "market state",
        :zip => 12345
        })
        expect(@market.id).to eq 123
      end
    end

    describe "find_vendors" do
      it "returns an array" do
        market_id = 1
        expect(FarMar::Market.find_vendors(market_id)).to be_an Array
      end
      it "has Vendor objects in the array" do
        market_id = 1
        expect(FarMar::Market.find_vendors(market_id)[0]).to be_an_instance_of FarMar::Vendor
      end
    end
  end
end
