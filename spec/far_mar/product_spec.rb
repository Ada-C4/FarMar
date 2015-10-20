require "spec_helper"

describe FarMar::Product do
  before :each do
    row = [1, "Product", 2]
    @product = FarMar::Product.new(row[0], row[1], row[2])
  end
  describe ".new" do
    it "creates a new instance of Product" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end
  describe "#initialize" do
    it "creates instance variables" do
      expect(@product.instance_variables.length).to eq 3
    end
    it "creates @vendor_id as an integer" do
      expect(@product.vendor_id.class).to eq Fixnum
    end
  end
  describe "self.all" do
    it "returns an array" do
      expect(FarMar::Product.all).to be_an Array
      expect(FarMar::Product.all.length).to eq 8193
    end
    it "creates an array with instances of Product" do
      expect(FarMar::Product.all[999]).to be_an_instance_of FarMar::Product
    end
  end
  describe "self.find(id)" do
    it "finds a product using its ID" do
      @id = 8171
      expect(FarMar::Product.find(@id).name).to eq "Lazy Pretzel"
    end
  end
  describe "#vendor" do
    it "returns a Vendor instance associated with the product" do
      @id = 2
      expect(FarMar::Product.find(@id).vendor).to be_an_instance_of FarMar::Vendor
    end
  end
  describe "#sales" do
    it "returns an array" do
      @id = 2
      expect(FarMar::Product.find(@id).sales).to be_an Array
      expect(FarMar::Product.find(@id).sales.length).to eq 1
    end
    it "creates an array with instances of Sale" do
      @id = 2
      expect(FarMar::Product.find(@id).sales[0]).to be_an_instance_of FarMar::Sale
    end
  end
end
