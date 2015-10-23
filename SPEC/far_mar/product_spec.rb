require "spec_helper"

describe FarMar::Product do
  before :each do
    product_hash={
      id: 1,
      name: "Dry Beets",
      vendor_id: 1
    }
    @product = FarMar::Product.new(product_hash)
  end

  describe "self.new" do
    it "creates a new instance of Product" do
      expect(@product).to be_an_instance_of FarMar::Product
    end

    it "has a name property that is equal to what is passed in" do
      expect(@product.name).to eq "Dry Beets"
    end

    it "knows about its associated data file" do
      expect(@product.products_csv).to eq ("./support/products.csv")
    end
  end

    describe "self.all" do
      all_products = FarMar::Product.all
      it "returns an array" do
        expect(all_products.class).to eq Array
        #test that it is an array
        expect(all_products[0]).to be_an_instance_of FarMar::Product
        expect(all_products[-1]).to be_an_instance_of FarMar::Product
        products_csv= CSV.read("./support/products.csv")
        expect(all_products.length).to eq (products_csv.length)
         #all markets length to equal csv.length
      end
    end

  #returns the instance of Market with matching the input # ID
    describe "self.find(id)" do
      it "returns an instance of FarMar::Product with its passed in id" do
      expect(FarMar::Product.find(1)).to be_an_instance_of FarMar::Product
      expect(FarMar::Product.find(1).id).to eq 1
      end
    end
  end
