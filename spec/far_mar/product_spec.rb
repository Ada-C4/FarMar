require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new(1, "tomato", 2)
    @all_products = FarMar::Product.all
  end
  describe ".new" do
    it "creates a new instance of product" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end
  describe "#id" do
    it "returns unique id for the product" do
      expect(@product.id).to eq 1
    end
  end
  describe "#name" do
    it "returns name for the product" do
      expect(@product.name).to eq "tomato"
    end
  end
  describe "#vendor_id" do
    it "returns the vendor ID for the product" do
      expect(@product.vendor_id).to eq 2
    end
  end
  describe "self.all" do
    it "creates an array" do
      expect(@all_products).to be_an Array
    end
    it "elements are instances of FarMar::Product" do
      expect(@all_products[0]).to be_an_instance_of FarMar::Product
    end
    it "creates a product for each row in the csv file" do
      expect(@all_products.length).to eq 8193
    end
  end
  describe "self.find(id)" do
    it "returns an instance of product with the passed id" do
      product_25 = FarMar::Product.find(25)
      expect(product_25).to be_an_instance_of FarMar::Product
      expect(product_25.id).to eq 25
    end
  end
  describe "#vendor" do
    it "returns the vendor associated with this product" do
      product = FarMar::Product.new("15","Comfortable Pretzel","8")
      expect(product.vendor).to be_an_instance_of FarMar::Vendor
      expect(product.vendor.id).to eq 8
    end
  end
  describe "#sales" do
    it "returns a collection of sales associated with the product" do
      product = FarMar::Product.new("50","Quaint Bread","17")
      expect(product.sales).to be_an Array
      expect(product.sales[3]).to be_an_instance_of FarMar::Sale
      expect(product.sales[2].product_id).to eq 50
    end
  end
  describe "#number_of_sales" do
    it "returns the number of times the product has been sold" do
      product = FarMar::Product.new("41","Thundering Carrots","15")
      expect(product.number_of_sales).to be_a Fixnum
      expect(product.number_of_sales).to eq 5
    end
  end
  describe "self.by_vendor(vendor_id)" do
    it "returns all products with a given vendor id" do
        vendor_10_products = FarMar::Product.by_vendor(10)
      expect(vendor_10_products).to be_an Array
      expect(vendor_10_products[2]).to be_an_instance_of FarMar::Product
      expect(vendor_10_products[3].vendor_id).to eq 10
    end
  end
  # describe "self.most_revenue(n)" do
  #   it "returns top n products ranked by revenue" do
  #     top_products_4 = FarMar::Product.most_revenue(4)
  #     expect(top_products_4).to be_an Array
  #     expect(top_products_4[0]).to be_an_instance_of FarMar::Product
  #     expect(top_products_4.length).to eq 4
  #   end
  # end
end
