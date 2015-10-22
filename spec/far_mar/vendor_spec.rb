require "spec_helper"

describe FarMar::Vendor do
  attr_accessor :id, :name, :employee_no, :market_id
  before :each do
    @vendor1 = FarMar::Vendor.new(:id => 1, :name => "Feil-Farrell", :employee_no => 8, :market_id => 1)
  end

  describe "initialize" do
    it "creates an instance of a market" do
      expect(@vendor1).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "self.all" do
    it "returns an array or all the vendors" do
      expect(FarMar::Vendor.all.length).to eq 2690
    end
  end

  describe ".find" do
    it "returns a vendor object" do
      expect(FarMar::Vendor.find(4)).to be_an_instance_of FarMar::Vendor
    end

    it "returns the correct vendor given an id" do
      expect(FarMar::Vendor.find(4).name).to eq "Kris and Sons"
    end
  end

  describe "#market" do
    it "returns a market" do
      expect(@vendor1.market).to be_an_instance_of FarMar::Market
    end

    it "returns the market with a matching market id" do
      expect(@vendor1.market.id).to eq @vendor1.market_id
    end
  end

  describe "#products" do
    it "returns an array" do
      expect(@vendor1.products).to be_an Array
    end

    it "returns an array of products" do
      expect(@vendor1.products.first).to be_an_instance_of FarMar::Product
    end
  end

  describe "#sales" do
    it "returns an array" do
      expect(@vendor1.sales).to be_an Array
    end

    it "returns an array of sales" do
      expect(@vendor1.sales.first).to be_an_instance_of FarMar::Sale
    end
  end

  describe "#revenue" do
    it "returns a number" do
      expect(@vendor1.revenue).to be_a Fixnum
    end
  end

  describe ".by_market" do
    it "return an array" do
      expect(FarMar::Vendor.by_market(1)).to be_an Array
    end

    it "returns an array of vendors" do
      expect(FarMar::Vendor.by_market(1).first).to be_an_instance_of FarMar::Vendor
    end
  end
end
