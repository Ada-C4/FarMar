require "spec_helper"

describe FarMar::Product do
  before :each do
    @csv = CSV.read("support/products.csv")
    @product1 = FarMar::Product.new(:id => 1, :name => "Dry Beets", :vendor_id => 1)
  end
  describe "initialize" do
    it "creates an instance of a product" do
      expect(@product1).to be_an_instance_of FarMar::Product
    end
  end

  describe "self.all" do
    it "returns an array or all the products" do
      expect(FarMar::Product.all.length).to eq @csv.length
    end
  end

  describe "self.find" do
    it "returns a product given an id" do
      expect(FarMar::Product.find(4).name).to eq "Yummy Fruit"
    end
  end

  describe "#vendor" do
    it "returns an instance of vendor" do
      expect(@product1.vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe  "#sales" do
    it "returns an array" do
      expect(@product1.sales).to be_an Array
    end

    it "returns and array of sale object" do
      expect(@product1.sales.first).to be_an_instance_of FarMar::Sale
    end
  end

  describe "#number_of_sales" do
    it "returns a number" do
      expect(@product1.number_of_sales).to be_a Fixnum
    end
  end

  describe ".by_vendor" do
    it "returns an array" do
      expect(FarMar::Product.by_vendor(1)).to be_an Array
    end

    it "returns an array of products" do
      expect(FarMar::Product.by_vendor(1).first).to be_an_instance_of FarMar::Product
    end
  end


end
