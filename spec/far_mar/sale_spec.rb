require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new("1", "120", "2013-11-11 11:29:52 -0800", "2", "123")
    @all_sales = FarMar::Sale.all
  end
  describe ".new" do
    it "creates a new instance of sale" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end
  describe "#id" do
    it "returns unique id for the sale" do
      expect(@sale.id).to eq 1
    end
  end
  describe "#amount" do
    it "returns the amount for the sale" do
      expect(@sale.amount).to eq 120
    end
  end
  describe "#purchase_time" do
    it "returns the purchase time for the sale that is a Datetime" do
      expect(@sale.purchase_time).to be_a(DateTime)
    end
  end
  describe "#vendor_id" do
    it "returns the vendor id for the sale" do
      expect(@sale.vendor_id).to eq 2
    end
  end
  describe "#product_id" do
    it "returns the product id for the sale" do
      expect(@sale.product_id).to eq 123
    end
  end
  describe "self.all" do
    it "creates an array" do
      expect(@all_sales).to be_an Array
    end
    it "elements are instances of FarMar::Sale" do
      expect(@all_sales[0]).to be_an_instance_of FarMar::Sale
    end
    it "creates a product for each row in the csv file" do
      expect(@all_sales.length).to eq 12798
    end
  end
end
