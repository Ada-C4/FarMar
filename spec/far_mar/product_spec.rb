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
end
