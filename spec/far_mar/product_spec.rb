require "spec_helper"

describe FarMar::Product do
  before :each do
    @products = FarMar::Product.all
  end

  describe "#new" do
    it "create a new instance of Product" do
      example_product_hash = {:id => 5, :name => "Test Product", :vendor_id => "25"}
      example_product = FarMar::Product.new(example_product_hash)
      expect(example_product).to be_an_instance_of FarMar::Product
    end
  end

  describe ".all" do
    it "creates a product object for every product listed in the datafile" do
      csv = CSV.read("support/products.csv")
      expect(@products.length).to eq csv.length
    end
  end

  describe ".find" do
    it "can find a product object with a given ID" do
      test_id = @products[2].product_id
      expect(FarMar::Product.find(test_id)).to eq @products[2]
    end
  end

  describe "#vendor" do
    it "returns a vendor object for the current product" do
      @products = FarMar::Product.all
      product = @products[1]
      expect(product.vendor).to be_an_instance_of FarMar::Vendor
    end

    it "returns the correct vendor object for a product" do
      product = @products[1]
      expect(product.vendor.vendor_name).to eq "Hamill, Kilback and Pfeffer"
    end
  end

  describe "#sales" do
    it "does not return an empty array" do
      product = @products[0]
      expect(product.sales).not_to eq []
    end

    it "returns the expected number of sales" do
      product = @products[0]
      expect(product.sales.length).to eq 7
    end
  end

end
