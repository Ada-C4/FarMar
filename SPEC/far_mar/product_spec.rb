require "spec_helper"

describe FarMar::Product do
  before :each do
    product_hash={
      id: 121,
      name: "marigolds",
      vendor_id: 45
    }
    @product = FarMar::Product.new(product_hash)
  end

  describe "self.new" do
    it "creates a new instance of Product" do
      expect(@product).to be_an_instance_of FarMar::Product
    end

    it "has a name property that is equal to what is passed in" do
      expect(@product.name).to eq "marigolds"
    end

    it "knows about its associated data file" do
      expect(@product.product_csv).to eq ("./support/products.csv")
    end
  end
end
