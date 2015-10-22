require "spec_helper"

describe FarMar do
  describe FarMar::Market do
    before :all do
      @market = FarMar::Market.new({
      :id => 123,
      :name => "market name",
      :address => "market address",
      :city => "market city",
      :county => "market county",
      :state => "market state",
      :zip => 12345
      })
      @market_hash = {
      :id => 123,
      :name => "market name",
      :address => "market address",
      :city => "market city",
      :county => "market county",
      :state => "market state",
      :zip => 12345
      }
    end

    describe "initialize" do
      it "creates an instance of a Market" do
        expect(FarMar::Market.new(@market_hash)).to be_an_instance_of FarMar::Market
      end
      # it "returns an error if not passed a market_hash" do
      #   @market_array = ["a","b"]
      #   expect(FarMar::Market.new(@market_array)).to raise_error TypeError, "no implicit conversion of Symbol into Integer"
      # end
    end

    # describe "self.create_market_hash" do
    #   it "" do
    #
    #   end
    # end

    describe "self.all" do
      it "returns an array" do
        expect(FarMar::Market.all).to be_an Array
      end
      it "has Market instances in the array" do
        expect(FarMar::Market.all[0]).to be_an_instance_of FarMar::Market
      end
      it "has the correct number of Market instances in the array" do
        expect(FarMar::Market.all.length).to eq 500
      end
    end

    describe "self.find" do
      it "returns an instance of market" do
        num = rand(1..500)
        expect(FarMar::Market.find(num)).to be_an_instance_of FarMar::Market
      end
      it "returns an instance of market with the correct ID" do
        num = 1
        market = FarMar::Market.find(num)
        expect(market.id).to eq 1
      end
      it "returns nil if the argument is not a Fixnum" do
        expect(FarMar::Market.find("abc")).to be_nil
        expect(FarMar::Market.find(1.24)).to be_nil
        expect(FarMar::Market.find(:id)).to be_nil
      end
      it "returns nil if passed a Fixnum that isn't a valid ID" do
        expect(FarMar::Market.find(-1)).to be_nil
      end
    end

    describe "id" do
      it "returns the ID of the market" do
        expect(@market.id).to eq 123
      end
    end

    describe "find_vendors" do
      it "returns an array" do
        market_id = 1
        expect(@market.find_vendors(market_id)).to be_an Array
      end
      it "has Vendor objects in the array" do
        market_id = 1
        expect(@market.find_vendors(market_id)[0]).to be_an_instance_of FarMar::Vendor
      end
      it "returns empty Array if the argument is not a Fixnum" do
        expect(@market.find_vendors("abc")).to eq []
        expect(@market.find_vendors(1.24)).to eq []
        expect(@market.find_vendors(:id)).to eq []
      end
      it "returns empty Array if passed a Fixnum that isn't a valid ID" do
        expect(@market.find_vendors(-1)).to eq []
      end
    end
  end
end
