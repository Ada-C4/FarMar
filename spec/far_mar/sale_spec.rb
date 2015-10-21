require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new(10, "150", "12:00pm", 2, 4)
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
    it "returns an instance of Sale where the value of the id field in the CSV matches the passed parameter" do
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
end
