require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendors = FarMar::Vendor.all
  end

  describe "#new" do
    it "create a new instance of Vendor" do
      sample_vendor_hash = {:id => 100, :name => "Test Testerson", :employees => 5000, :market_id => 4}
      sample_vendor = FarMar::Vendor.new(sample_vendor_hash)
      expect(sample_vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe ".all" do
    it "creates a vendor object for every vendor listed in the datafile" do
      csv = CSV.read("support/vendors.csv")
      expect(@vendors.length).to eq csv.length
    end
  end

  describe ".find" do
    it "can find a vendor object with a given ID" do
      test_id = @vendors[2].vendor_id
      expect(FarMar::Vendor.find(test_id)).to eq @vendors[2]
    end
  end

  describe "#market" do
    it "returns a market object for the current vendor" do
      vendor = @vendors[1]
      expect(vendor.market).to be_an_instance_of FarMar::Market
    end

    it "returns the correct market object for a vendor" do
      vendor = @vendors[1]
      expect(vendor.market.name).to eq "People's Co-op Farmers Market"
    end
  end

  describe ".by_market" do
    it "does not return nil" do
      test_market = 1
      expect(FarMar::Vendor.by_market(test_market)).not_to eq []
    end

    it "returns the correct number of vendors" do
      test_market = FarMar::Market.find(1)
      vendors_for_market = test_market.vendors
      expect(FarMar::Vendor.by_market(1).length).to eq vendors_for_market.length
    end
  end

  describe "#products" do
    it "does not return an empty array" do
      test_vendor = FarMar::Vendor.find(1)
      expect(test_vendor.products).not_to eq []
    end

    it "returns the correct array of products" do
      test_vendor = FarMar::Vendor.find(2)
      expect(test_vendor.products[0].product_name).to eq "Fierce Greens"
      expect(test_vendor.products[1].product_name).to eq "Heavy Chicken"
      expect(test_vendor.products.length).to eq 2
    end
  end

  describe "#sales" do
    it "does not return an empty array" do
      test_vendor = FarMar::Vendor.find(1)
      expect(test_vendor.sales).not_to eq []
    end

    it "returns the correct number of sales" do
      test_vendor = FarMar::Vendor.find(1)
      expect(test_vendor.sales.length).to eq 7
    end
  end

  describe "#revenue" do
    it "returns a fixnum value" do
      test_vendor = FarMar::Vendor.find(1)
      expect(test_vendor.revenue).to be_an_instance_of Fixnum
    end

    it "returns the correct value for example data" do
      test_vendor = FarMar::Vendor.find(1)
      expect(test_vendor.revenue).to eq 38259
    end
  end

  describe ".most_revenue" do
    it "returns an array of length n" do
      result = FarMar::Vendor.most_revenue(10)
      expect(result.length).to eq 10
      expect(result).to be_an_instance_of Array
      expect(result[0]).to be_an_instance_of FarMar::Vendor
    end
    it "returns the correct product for a test data set" do
      expected_vendor_name = "Reynolds, Schmitt and Klocko"
      result = FarMar::Vendor.most_revenue(10)
      expect(result[0].vendor_name).to eq expected_vendor_name
    end
  end

  describe ".most_items" do
    it "returns an array of length n" do
      result = FarMar::Vendor.most_items(10, "./test_data/test_vendors.csv")
      expect(result.length).to eq 10
      expect(result).to be_an_instance_of Array
      expect(result[0]).to be_an_instance_of FarMar::Vendor
    end
    it "returns the correct product for a test data set" do
      expected_vendor_name = "Dickens-Weissnat"
      result = FarMar::Vendor.most_items(10, "./test_data/test_vendors.csv")
      expect(result[0].vendor_name).to eq expected_vendor_name
    end
    it "restores sales to original data" do
      expect(FarMar::Sale.all.length).to eq 12798
    end
  end


end
