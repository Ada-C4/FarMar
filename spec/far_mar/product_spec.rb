require 'spec_helper'

describe FarMar do
  describe FarMar::Product do

    describe "#initialize" do
      it "creates a new Product instance" do
        fake_hash = {
          :id => 1,
          :name => "Crispy Spiders",
          :vendor_id => 5555
        }
        product = FarMar::Product.new(fake_hash)
        expect(product).to be_an_instance_of(FarMar::Product)
        expect(product.id).to eq(1)
        expect(product.name).to eq("Crispy Spiders")
        expect(product.vendor_id).to eq(5555)
      end
    end

    describe ".all" do
      it "returns an array of 8193 Product objects" do
        all_products = FarMar::Product.all
        expect(all_products).to be_an(Array)
        expect(all_products.length).to eq(8193)
        expect(all_products[0]).to be_an_instance_of(FarMar::Product)
        expect(all_products[-1]).to be_an_instance_of(FarMar::Product)
        expect(all_products[-1].name).to eq("Cruel Beef")
      end
    end

    describe ".find(id)" do
      it "returns Product object for matching ID" do
        result = FarMar::Product.find(11)
        expect(result).to be_an_instance_of(FarMar::Product)
        expect(result.name).to eq("Gigantic Bread")
        expect(result.vendor_id).to eq(6)
      end
    end
  end
end
