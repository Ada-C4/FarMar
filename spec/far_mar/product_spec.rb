require "spec_helper"
describe FarMar do
  describe FarMar::Product do
    
    before :each do
      product_info = CSV.open("./support/products.csv", 'r') { |csv| csv.first }
      @product = FarMar::Product.new(product_info)
    end

    describe "#initialize" do
      it "creates a new instance of the Product class" do
        expect(@product).to be_an_instance_of(FarMar::Product)
      end
      it "retrieves the product ID from the product info array" do
        expect(@product.id).to eq(1)
      end
    end

    describe ".all" do
      before :each do
        @products = CSV.read("./support/products.csv")
      end
      it "returns an array" do
        expect(FarMar::Product.all).to be_an(Array)
      end
      it "returns an array with all the products" do
        expect(FarMar::Product.all.length).to eq(@products.size)
      end
      it "contains instances of the Product class" do
        vendor_total = FarMar::Product.all.length
        expect(FarMar::Product.all[0]).to be_an_instance_of(FarMar::Product)
        expect(FarMar::Product.all[vendor_total - 1]).to be_an_instance_of(FarMar::Product)
        expect(FarMar::Product.all[vendor_total]).to be nil
      end
    end

    describe ".find(id)" do
      before :each do
        @id = rand(1..8193)
      end
      it "returns an instance of Product" do
        expect(FarMar::Product.find(@id)).to be_an_instance_of(FarMar::Product)
      end
      it "returns the Product with the matching id" do
        expect(FarMar::Product.find(@id).id).to eq(@id)
      end
    end

    describe "#vendor" do
      it "returns an instance of the Vendor class" do
        expect(@product.vendor).to be_an_instance_of(FarMar::Vendor)
      end
      it "returns the Vendor with the matching id" do
        expect(@product.vendor_id).to eq(@product.vendor.id)
      end
    end

  end
end
