require "spec_helper"

describe FarMar::Market do
  before :each do
    @market = FarMar::Market.new(1, "Bob", "123 Street", "Seattle", "King", "WA", "98103")
  end

  describe "initialize" do
      it "creates a new instance of Market" do
        expect(@market).to be_an_instance_of FarMar::Market
      end
  end

# self.all - returns a collection of Market instances,
# representing all of the markets described in the CSV

  describe "self.all" do
    it "creates an array of instances of the Market class" do
    expect(FarMar::Market.all).to be_an Array
    end
  end

  describe "self.findall" do
    it "returns an ID for a market passed in as a parameter" do
      twelve = FarMar::Market.find(12)
    expect(twelve).to be_an_instance_of FarMar::Market
    expect(twelve.id).to eq 12
    end
  end

  describe "vendors" do
    it "returns the number of vendors that have a specified market ID" do
    expect(@market.vendors.length).to eq 6
    end
  end

end


# are we creating a new instance of Vendor
#can we specifically find 1 MARKET ID based on that instances
# can we match that market ID to the FarMar::Market(id)
    #
    # FarMar::Vendor.all
    # FarMar::Vendor.market_id
    # it "returns specific vendors based on their market_id" do
    # expect(all_vendors.length).to be eq to 1
    # expect((FarMar::Vendor.market_id).to be eq to FarMar::Market.find(15)
    # .length - will get length of array




    # DONE! we have to give it an id using the find.id method
    # we have to connect the vendor & market id
    # vendor has vendor info, so can't have it be equal to market stuff.
    # have to have the market_id match the ID
    # vendor method returns a collection of vendor instances
    # when you call the vendors method it creates a new instance of vendors
    # FarMar::Market.find(14)
    #this method should comare that FarMar::Vendor.market_id
