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

end
