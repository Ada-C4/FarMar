require "spec_helper"
describe FarMar do
  describe FarMar::Product do

    describe ".new" do
      before :each do
        @product = FarMar::Product.new
      end
      it "creates a new instance of the Product class" do
        expect(@product).to be_an_instance_of(FarMar::Product)
      end
    end

    describe ".all" do
      before :each do
        @products = CSV.read("./support/products.csv")
      end
      it "returns an array" do
        expect(FarMar::Product.all).to be_an(Array)
      end
      it "returns an array with the vendor info" do
        expect(FarMar::Product.all.length).to eq(@products.size)
      end
    end

  end
end
