require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new({
      id: "1",
      amount: "9290",
      purchase_time: "2013-11-07 04:34:56 -0800",
      vendor_id: "1",
      product_id:"1"
      })
  end

  describe ".new" do
    it "creates a new instance of Sale" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

  describe "#all" do
    all_sales = FarMar::Sale.all
    it "returns a collection of all sale instances in the csv" do
      expect(all_sales.class).to eq Array
      expect(all_sales[0]).to be_an_instance_of FarMar::Sale
      expect(all_sales[-1]).to be_an_instance_of FarMar::Sale
      csv = CSV.read("support/sales.csv")
      expect(all_sales.length).to eq csv.length
    end
  end

  describe "#find" do
    it "returns the instance of Sale matching the input id" do
      expect(FarMar::Sale.find(1)).to be_an_instance_of FarMar::Sale
      expect(FarMar::Sale.find(2).amount).to eq 2262
    end
  end

  describe ".vendor" do
    it "returns the Vendor instance associated with the sale" do
      expect(@sale.vendor).to be_an_instance_of FarMar::Vendor
      expect(@sale.vendor.name).to eq "Feil-Farrell"
    end
  end

  describe ".product" do
    it "returns the Product instance associated with the sale" do
      expect(@sale.product).to be_an_instance_of FarMar::Product
      expect(@sale.product.name).to eq "Dry Beets"
    end
  end

  describe "#between" do
    it "returns a collection of Sale instances where the purchase time is between the two times given." do
      @begin = DateTime.parse("2013-11-12 06:03:50 -0800")
      @end = DateTime.parse("2013-11-13 01:48:19 -0800")
      expect(FarMar::Sale.between(@begin, @end)).to be_an Array
    end
  end

end
