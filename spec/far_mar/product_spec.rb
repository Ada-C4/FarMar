require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new
  end

  describe ".new" do
    it "creates a new instance of a product" do
      expect(@product).to be_an_instance_of FarMar::Product
    end

    it "by default assigns empty strings to instance variables" do
      expect(@product.name).to eq ""
      expect(@product.vendor_id).to eq ""
    end

    it "accepts parameters passed in" do
      @product2 = FarMar::Product.new("15", "Best product", "5")
      expect(@product2.name).to eq "Best product"
      expect(@product2.vendor_id).to eq "5"
    end
  end

  describe "self.all" do
    context "default csv is passed in" do
      it "creates an array of product objects from default csv" do
        all = FarMar::Product.all
        my_csv = CSV.read("./support/products.csv")
        expect(all.length).to eq my_csv.length
        expect(all).to be_an_instance_of Array
        expect(all[0].class).to eq FarMar::Product
        expect(all[16].name).to eq "Defeated Apples"
      end
    end

    context "non-default csv is passed in" do
      it "creates an array of product objects from default csv" do
        all = FarMar::Product.all("./support/products2.csv")
        my_csv = CSV.read("./support/products2.csv")
        expect(all.length).to eq my_csv.length
        expect(all).to be_an_instance_of Array
        expect(all[0].class).to eq FarMar::Product
        expect(all[6].name).to eq "Adorable Beef"
      end
    end
  end

  describe "self.find" do
    context "default csv is passed in" do
      it "returns an instance of a product matching the passed id" do
        id15 = FarMar::Product.find(15)
        id33 = FarMar::Product.find(33)
        expect(id15.name).to eq "Comfortable Pretzel"
        expect(id33.class).to eq FarMar::Product
        expect(id33.vendor_id).to eq "12"
      end
    end

    context "non-default csv is passed in" do
      it "returns an instance of a product matching the passed id" do
        id9 = FarMar::Product.find(9, "./support/products2.csv")
        expect(id9.name).to eq "Funky Mushrooms"
        expect(id9.class).to eq FarMar::Product
      end
    end
  end

  describe "self.by_vendor" do
    it "returns an array of products with the given vendor_id" do
    vendor_id5 = FarMar::Product.by_vendor(5, csv = "./support/products2.csv")
    expect(vendor_id5).to be_an(Array)
    expect(vendor_id5.empty?).to eq false
    expect(vendor_id5[2].name).to eq "Black Apples"
    end
  end
end
