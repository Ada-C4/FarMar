require 'spec_helper'
describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new("8188", "Brief Carrots", "2689")
  end
  describe "#new" do
    it "creates a new Product instance" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end
  describe "#all" do
    it "creates new Product instances" do
      expect(FarMar::Product.all[0].name).to eq "Dry Beets"
    end
    it "returns a collection representing all the products in the CSV" do
      expect(FarMar::Product.all.length).to eq 8193
    end
  end
  describe "#find(id)" do
    it "returns the product instance with an id matching the parameter" do
      expect(FarMar::Product.find(14).id).to eq 14
    end
  end
  describe ".vendor" do
    it "returns the vendor instance whose id matches the product's vendor_id" do
      expect(@product.vendor.id).to eq 2689
    end
  end
  describe ".sales" do
    it "returns a collection of sales instances whose product_id matches the product's id" do
      expect(@product.sales.length).to eq 2
    end
  end
  describe ".number_of_sales" do
    it "returns number of sales instances whose product_id matches the product's id" do
      expect(@product.number_of_sales).to eq 2
    end
  end
  describe "#by_vendor(vendor_id)" do
    it "returns all product instances whose vendor_id matches the parameter passed in" do
      vendor = FarMar::Product.by_vendor(2672)
      expect(vendor.length).to eq 4
    end
  end
end
