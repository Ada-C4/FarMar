require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new(10, "150", "2013-11-07 04:34:56 -0800", 2, 4)
  end
  describe "#initialize" do
    it "creates a new instance" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

  describe "self.all" do
    it "creates an array of sales" do
      expect(FarMar::Sale.all).to be_an Array
    end
  end

  describe "self.find" do
    it "returns sale instance where the value of the id the passed parameter" do
      result = FarMar::Sale.find(3)
      expect(result).to be_an Object
      expect(result.sale_id).to eq 3
    end
  end

  describe "vendor" do
    it "returns the vendor instance that is associated with the sale" do
      sale_vendor = @sale.vendor
      expect(sale_vendor).to be_an Object
      expect(sale_vendor.vendor_id).to eq 2
    end
  end

  describe "product" do
    it "returns the product instance that is associated with the sale" do
      sale_product = @sale.product
      expect(sale_product).to be_an Object
      expect(sale_product.product_id).to eq 4
    end
  end

  describe "self.between(beginning_time, end_time)" do
    before :each do
      @beginning_time = DateTime.strptime("2013-11-07 04:34:56 -0800", "%Y-%m-%d %H:%M:%S %z")
      @end_time = DateTime.strptime("2013-11-10 01:51:24 -0800", "%Y-%m-%d %H:%M:%S %z")
      @begin = DateTime.strptime("2013-11-07 05:00:24 -0800", "%Y-%m-%d %H:%M:%S %z")
      @end = DateTime.strptime("2013-11-09 10:00:24 -0800", "%Y-%m-%d %H:%M:%S %z")
      @id = 10
    end
      it "returns a collection of sales between two specific times" do
        sales_by_time = FarMar::Sale.between(@beginning_time, @end_time)
        expect(FarMar::Sale.find(10).purchase_time).to be_between @beginning_time, @end_time
        expect(@end).to be_between @beginning_time, @end_time
        expect(sales_by_time).to be_an Array
        expect(sales_by_time[0]).to be_an Object
      end
  end
end
