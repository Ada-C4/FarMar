require "spec_helper"

describe FarMar::Product do
  before :each do
    @product=FarMar::Product.new(2,"Fierce Greens",2)
  end

  describe "initialize Product" do
    it "creat a new product" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

  describe ".all" do
    it "returns a collection of Product instances" do
      expect(FarMar::Product.all).to be_an(Array)
    end
  end

  describe "find" do
    it "return the product, usind id " do
      expect(FarMar::Product.find(8).name).to eq("Shaky Honey")
    end
  end

  describe "vendor" do
    it "return products by vendor id" do
      vendor_array = FarMar::Product.vendor(2)
      expect(vendor_array[0].id).to eq 2
    end
  end

  describe "sales" do
    it "return an array of sales" do
      expect(@product.sales).to be_an(Array)
    end

    it "return an array of sales for this product" do
    expect(@product.sales[0].id).to eq 8
    end
  end

  describe "number_of_sales" do
    it "returns how many time this product got sold" do
    expect(@product.number_of_sales).to eq 1
    end

    it "return an integer" do
      expect(@product.number_of_sales).to be_an_instance_of(Fixnum)
    end
  end

end
