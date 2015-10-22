require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new
  end

  describe ".new" do
    it "creates a new instance of a vendor" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end

    it "by default assigns empty strings to instance variables" do
      expect(@vendor.name).to eq ""
      expect(@vendor.employees).to eq ""
    end

    it "accepts parameters passed in" do
      @vendor2 = FarMar::Vendor.new("23", "Best vendor", "9", "5")
      expect(@vendor2.name).to eq "Best vendor"
      expect(@vendor2.employees).to eq "9"
    end
  end

  describe "self.all" do
    context "default csv is passed in" do
      it "creates an array of vendor objects from default csv" do
        all = FarMar::Vendor.all
        my_csv = CSV.read("./support/vendors.csv")
        expect(all.length).to eq my_csv.length
        expect(all).to be_an_instance_of Array
        expect(all[0].class).to eq FarMar::Vendor
        expect(all[19].name).to eq "Ledner Group"
      end
    end

    context "non-default csv is passed in" do
      it "creates an array of vendor objects from default csv" do
        all = FarMar::Vendor.all("./support/vendors2.csv")
        my_csv = CSV.read("./support/vendors2.csv")
        expect(all.length).to eq my_csv.length
        expect(all).to be_an_instance_of Array
        expect(all[0].class).to eq FarMar::Vendor
        expect(all[5].employees).to eq "8000"
      end
    end
  end

  describe "self.find" do
    context "default csv is passed in" do
      it "returns an instance of a vendor matching the passed id" do
        id15 = FarMar::Vendor.find(15)
        id33 = FarMar::Vendor.find(33)
        expect(id15.name).to eq "Hyatt-King"
        expect(id33.class).to eq FarMar::Vendor
        expect(id33.employees).to eq "2"
      end
    end

    context "non-default csv is passed in" do
      it "returns an instance of a vendor matching the passed id" do
        id9 = FarMar::Vendor.find(9, "./support/vendors2.csv")
        expect(id9.name).to eq "Fakey Fake Vendor"
        expect(id9.class).to eq FarMar::Vendor
      end
    end
  end

  describe "self.by_market" do
    it "returns an array of vendors matching the passed market_id" do
    market_id3 = FarMar::Vendor.by_market(3, csv = "./support/vendors2.csv")
    expect(market_id3).to be_an(Array)
    expect(market_id3.empty?).to eq false
    expect(market_id3[0].name).to eq "Fakey Fake Vendor"
    end
  end

  describe "#market" do
    it "returns the market instance associated with the given vendor" do
      @vendor3 = FarMar::Vendor.new("4", "Best vendor", "9", "5")
      market_match = @vendor3.market("./support/markets2.csv")
      expect(market_match).to be_an_instance_of FarMar::Market
      expect(market_match.id).to eq "5"
      expect(market_match.name).to eq "Secret Market"
    end
  end

  describe "#products" do
    it "returns an array of products associated with the given vendor" do
      @vendor3 = FarMar::Vendor.new("4", "Best vendor", "9", "5")
      product_matches = @vendor3.products("./support/products2.csv")
      expect(product_matches).to be_an(Array)
      expect(product_matches[0].vendor_id).to eq "4"
      expect(product_matches[0].name).to eq "Special Apples"
    end
  end

  describe "#sales" do
    it "returns an array of sales associated with the given vendor" do
      @vendor3 = FarMar::Vendor.new("4", "Best vendor", "9", "5")
      sale_matches = @vendor3.sales("./support/sales2.csv")
      expect(sale_matches).to be_an(Array)
      expect(sale_matches[0].vendor_id).to eq "4"
      expect(sale_matches[0].id).to eq "8"
    end
  end
end
