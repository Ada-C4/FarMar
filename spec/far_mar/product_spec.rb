require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new(12, "Gorgeous Fish", 6)
    @product_2 = FarMar::Product.new(8193, "Cruel Beef", 2690)
  end

  context "initializing" do
    it "returns a product object" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

  context ".self.all" do
    it "returns an array" do
      expect(FarMar::Product.all().class).to be Array
    end
    it "returns instances of all lines in the csv" do
      expect(FarMar::Product.all().length).to eq 8193
    end
  end

  context ".self.find(id)" do
    it "returns an instance of Product" do
      expect(@product.class).to be FarMar::Product
    end

    it "returns an instance with the same id as the value in the CSV file" do
      expect(@product.id).to eq 12
      expect(@product_2.id).to eq 8193
    end
  end

  context ".self.by_vendor(vendor_id)" do
    it "returns all of the products with a given vendor id" do
        expect(FarMar::Product.by_vendor(6).length).to eq 3
    end
  end

end
