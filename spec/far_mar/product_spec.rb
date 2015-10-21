require "./spec/spec_helper"

describe FarMar::Product do
  before :each do
    @product1 = FarMar::Product.new(5, "name", 100)
    @product2 = FarMar::Product.new(6, "name", 400)
  end
  describe "#initialize" do
    it "creates new instance of product" do
      expect(@product1).to be_instance_of FarMar::Product
      expect(@product2).to be_instance_of FarMar::Product
    end
  end
  describe "#self.all" do
    it "returns an array" do
      expect(FarMar::Product.all).to be_an Array
    end
    it "returns 8193 items in array" do
      expect(FarMar::Product.all.length).to eq 8193
    end
  end
  describe "#self.find(id)" do
    it "returns an instance of FarMar::Product" do
      expect(FarMar::Product.find(1)).to be_instance_of FarMar::Product
    end
    it "returns correct instance of FarMar::Vendor" do
      expect(FarMar::Product.find(1).name).to eq "Dry Beets"
      expect(FarMar::Product.find(2).name).to eq "Fierce Greens"
    end
  end
  describe "#vendor" do
    it "returns an instance of FarMar::Vendor" do
      expect(@product1.vendor).to be_instance_of FarMar::Vendor
    end
    it "returns correct instance of FarMar::Vendor" do
      expect(@product1.vendor.name).to eq "Bernier, Moen and Torp"
      expect(@product2.vendor.name).to eq "Howe LLC"
    end
  end
  describe "#sales" do
    it "returns an instance of FarMar::Sale" do
      expect(@product1.sales).to be_an Array
    end
    it "returns array of instances of FarMar::Sale" do
      expect(@product1.sales[0]).to be_instance_of FarMar::Sale
      expect(@product1.sales[-1]).to be_instance_of FarMar::Sale
    end
    it "returns correct array length" do
      expect(@product1.sales.length).to eq 2
      expect(@product2.sales.length).to eq 1
    end
    it "returns correct first instance of FarMar::Vendor" do
      expect(@product1.sales[0].id).to eq 18
      expect(@product2.sales[0].id).to eq 19
    end
  end
  describe "#number_of_sales" do
    it "returns an integer" do
      expect(@product1.number_of_sales).to be_a Fixnum
    end
    it "returns correct num times a product has been sold" do
      expect(@product1.number_of_sales).to eq 2
      expect(@product2.number_of_sales).to eq 1
    end
  end
end
