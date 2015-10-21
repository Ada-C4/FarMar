require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new({
      id: "56",
      name: "Nom nom Beef",
      vendor_id: "19"
      })
  end

  describe ".new" do
    it "creates a new instance of Product" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

  describe "#all" do
    all_products = FarMar::Product.all
    it "returns a collection of all product instances in the csv" do
      expect(all_products.class).to eq Array
      expect(all_products[0]).to be_an_instance_of FarMar::Product
      expect(all_products[-1]).to be_an_instance_of FarMar::Product
      csv = CSV.read("support/products.csv")
      expect(all_products.length).to eq csv.length
    end
  end

  describe "#find" do
    it "returns the instance of Product matching the input id" do
      expect(FarMar::Product.find(1)).to be_an_instance_of FarMar::Product
      expect(FarMar::Product.find(3).name).to eq "Heavy Chicken"
    end
  end

  describe ".vendor" do
    it "returns the Vendor instance that is associated with this product" do
      expect(@product.vendor).to be_an_instance_of FarMar::Vendor
      expect(@product.vendor.name).to eq "Labadie-Tremblay"
    end
  end

  describe ".sales" do
    it "returns a collection of sales instances associated with this product" do
      expect(@product.sales).to be_an Array
      expect(@product.sales.length).to eq 2
    end
  end

end
