require "spec_helper"

describe FarMar do
  describe FarMar::Product do
    before :each do
      #@product = FarMar::Product.all
    end

    describe "#initialize" do
      it "creates a new instance of Product" do
        fake_hash = {:id => 111, :name => "Snickers", :vendor_id => 909}
        test = FarMar::Product.new(fake_hash)
        expect(test).to be_an_instance_of FarMar::Product
      end
    end

    describe '#self.all' do
      it "returns a collection of Product instances" do
        expect(FarMar::Product.all.length).to eq CSV.read("support/products.csv").length
      end
    end

    describe "self.find(id)" do
      it "returns specific instance of product" do
        find_test = FarMar::Product.find(15)
        expect(find_test.name).to eq "Comfortable Pretzel"
      end
    end
  end
end
