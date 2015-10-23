require "spec_helper"
require 'pry'

describe FarMar::Vendor do
  before :each do
    row = [1, "Name", 10, 5]
    @vendor = FarMar::Vendor.new(row[0], row[1], row[2], row[3])
  end
  describe ".new" do
    it "creates a new instance of Vendor" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end
  describe "#initialize" do
    it "creates instance variables" do
      expect(@vendor.instance_variables.length).to eq 4
    end
    it "creates @id as an integer" do
      expect(@vendor.id.class).to eq Fixnum
    end
  end
  describe "self.all" do
    it "returns an array" do
      expect(FarMar::Vendor.all).to be_an Array
    end
    it "creates an array of Vendor instances" do
      expect(FarMar::Vendor.all[0]).to be_an_instance_of FarMar::Vendor
    end
  end
  describe "self.find(id)" do
    it "finds a vendor using its ID" do
      @id = 10
      expect(FarMar::Vendor.find(@id).id).to eq 10
      expect(FarMar::Vendor.find(@id)).to eq FarMar::Vendor.find(@id)
    end
  end
  describe "#market" do
    it "returns the market associated with the vendor" do
      @id = 2
      @vendor = FarMar::Vendor.find(@id)
      expect(@vendor.market).to be_an_instance_of FarMar::Market
      expect(@vendor.market.id).to eq 1
    end
  end
  describe "#products" do
    it "returns an array" do
      @id = 15
      @vendor = FarMar::Vendor.find(@id)
      expect(@vendor.products).to be_an Array
      expect(@vendor.products.length).to eq 4
    end
    it "creates an array with vendor products" do
      # binding.pry
      expect(@vendor.products[0]).to be_an_instance_of FarMar::Product
    end
  end
  describe "#sales" do
    it "returns an array" do
      @id = 3
      @vendor = FarMar::Vendor.find(@id)
      expect(@vendor.sales).to be_an Array
      expect(@vendor.sales.length).to eq 3
    end
    it "creates an array of Sale instances" do
      expect(@vendor.sales[5]).to be_nil
      expect(@vendor.sales[0]).to be_an_instance_of FarMar::Sale
    end
  end
  describe "#revenue" do
    it "returns the sum of the vendor's sales" do
      @id = 9
      @vendor = FarMar::Vendor.find(@id)
      expect(@vendor.revenue.class).to eq Fixnum
      expect(@vendor.revenue).to eq 9341 + 3461
    end
  end
  describe "self.by_market(market_id)" do
    it "returns an array of vendors for a particular market ID" do
      @market_id = 4
      expect(FarMar::Vendor.by_market(@market_id).length). to eq 3
    end
  end
  describe "self.most_revenue(n)" do
    it "returns an array" do
      expect(FarMar::Vendor.most_revenue(2)).to be_an Array
    end
    it "returns an array of n or less Vendor instances" do
      expect(FarMar::Vendor.most_revenue(2)[0]).to be_an_instance_of FarMar::Vendor
      expect(FarMar::Vendor.most_revenue(2)[0].revenue).to be >= FarMar::Vendor.most_revenue(2)[1].revenue
    end
  end
  describe "self.most_items(n)" do
    it "returns an array" do
      expect(FarMar::Vendor.most_items(2)).to be_an Array
    end
    it "returns an array with n or less Vendor instances" do
      expect(FarMar::Vendor.most_items(2)[0]).to be_an_instance_of FarMar::Vendor
      expect(FarMar::Vendor.most_items(2)[0].products.length).to be >= FarMar::Vendor.most_items(2)[1].products.length
      expect(FarMar::Vendor.most_items(4)[0].id).to eq 11
      expect(FarMar::Vendor.most_items(4)[1].id).to eq 10
    end
  end
  describe "self.revenue(date)" do
    it "returns a Fixnum" do
      @date = "2013-11-07 04:34:56 -0800"
      expect(FarMar::Vendor.revenue(@date)).to be_an Fixnum
      expect(FarMar::Vendor.revenue(@date)).to eq 626 + 8296 + 8362 + 7256
    end
  end
  describe "#daily_sales(date)" do
    it "returns a Fixnum" do
      @date = "2013-11-07 04:34:56 -0800"
      @id = 3
      @vendor = FarMar::Vendor.find(@id)
      expect(@vendor.daily_sales(@date)).to be_an Fixnum
      expect(@vendor.daily_sales(@date)).to eq 0
      @date = "2013-11-10 18:56:53 -0800"
      expect(@vendor.daily_sales(@date)).to eq 9128 + 1030
    end
  end
end
