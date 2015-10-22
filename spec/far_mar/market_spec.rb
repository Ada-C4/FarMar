require "spec_helper"

describe FarMar::Market do
  before :each do
    @markets = FarMar::Market.all
  end

  describe "#new" do
    it "create a new instance of Market" do
      example_market_hash = {:name => "Test Market", :id => 77, :address => "123 Test Street", :city => "Testland", :county => "Test County", :state => "WV", :zip => "00000"}
      test_market = FarMar::Market.new(example_market_hash)

      expect(test_market).to be_an_instance_of FarMar::Market
    end
  end

  describe ".all" do
    it "creates a market object for every market listed in the datafile" do
      csv = CSV.read("support/markets.csv")
      expect(@markets.length).to eq csv.length
    end
  end

  describe ".find" do
    it "can find a market object with a given ID" do
      test_id = @markets[2].id
      expect(FarMar::Market.find(test_id)).to eq @markets[2]
    end
  end

  describe "#vendors" do
    it "does not return nil" do
      sample_market_id = 1
      sample_market = FarMar::Market.find(sample_market_id)
      matched_vendors = FarMar::Vendor.all
      matched_vendors = matched_vendors.find_all { |vendor| vendor.market_id == sample_market_id}
      expect(sample_market.vendors).not_to eq []
    end
    it "returns all vendors associated with market_id" do
      sample_market_id = 1
      matched_vendors = FarMar::Vendor.all
      sample_market = FarMar::Market.find(sample_market_id)
      matched_vendors = matched_vendors.find_all { |vendor| vendor.market_id == sample_market_id}
      expect(sample_market.vendors.length).to eq matched_vendors.length
    end
  end

  describe "#products" do
    it "returns an array with products in it" do
      sample_market = @markets[1]
      expect(sample_market.products).to be_an_instance_of Array
      expect(sample_market.products).not_to eq []
    end

    it "returns the correct products for a given market" do
      sample_market = @markets[1]
      expect(sample_market.products.length).to eq 9
      expect(sample_market.products[0].product_name).to eq "Stupendous Carrots"
    end
  end

  describe "#preferred_vendor" do
    it "returns a vendor object" do
      sample_market = @markets[1]
      expect(sample_market.preferred_vendor).to be_an_instance_of FarMar::Vendor
    end
    it "returns the vendor object with the highest revenue" do
      sample_market = @markets[1]
      all_vendors = sample_market.vendors
      max = all_vendors.max_by { |i| i.revenue}
      expect(sample_market.preferred_vendor).to eq max
    end
    it "when passed a date, returns a vendor objects" do
      sample_market = @markets[1]
      expect(sample_market.preferred_vendor(2013,11,7)).not_to eq nil
      expect(sample_market.preferred_vendor(2013,11,7)).to be_an_instance_of FarMar::Vendor
    end
    it "when passed a date, returns the expected vendor" do
      sample_market = @markets[1]
      expect(sample_market.preferred_vendor(2013,11,7).vendor_name).to eq "Bechtelar Inc"
    end

  end

  describe "#worst_vendor" do
    it "returns a vendor object" do
      sample_market = @markets[1]
      expect(sample_market.worst_vendor).to be_an_instance_of FarMar::Vendor
    end

    it "returns the vendor object with the lowest revenue" do
      sample_market = @markets[1]
      all_vendors = sample_market.vendors
      min = all_vendors.min_by { |i| i.revenue}
      expect(sample_market.worst_vendor).to eq min
    end
    it "when passed a date, returns a vendor objects" do
      sample_market = @markets[1]
      expect(sample_market.worst_vendor(2013,11,7)).not_to eq nil
      expect(sample_market.worst_vendor(2013,11,7)).to be_an_instance_of FarMar::Vendor
    end
    it "when passed a date, returns the expected vendor" do
      sample_market = @markets[1]
      expect(sample_market.worst_vendor(2013,11,7).vendor_name).to eq "Quigley, Breitenberg and Schuster"
    end
  end

  describe ".search" do
    it "returns the correct number of entries for the sample search" do
      sample_search = 'school'
      expect(FarMar::Market.search(sample_search).length).to eq 3
    end

    it "returns can also search for vendors" do
      expect(FarMar::Market.search("Watsica")[0].name).to eq "Charlestown Farmers Market"
    end
  end

end
