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
      vendor = @product.vendor
      expect(vendor.id).to eq 2689
      expect(vendor.name).to eq "Durgan-Moen"
    end
  end
end
