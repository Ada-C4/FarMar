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

    describe "list_vendors" do
      it "returns specific vendor instance" do
        vendor_test = FarMar::Product.find(98)
        expect(vendor_test.list_vendors.name).to eq "Jakubowski-Robel"
      end
    end

    describe "list_sales" do
      it "returns array of sale instances" do
        sale_test = FarMar::Product.find(109)
        sale_test.list_sales.each do |sale|
          expect(sale.product_id).to eq 109
        end
      end
    end

    describe "number_of_sales" do
      it "sums up total sale instances for specific product" do
        number_test = FarMar::Product.find(8)
        expect(number_test.number_of_sales).to eq 5
      end
    end

    describe "self.by_vendor" do
      it "returns array of products" do
        testcase = FarMar::Product.by_vendor(202)
        testcase.each do |product|
          expect(product.list_vendors.name).to eq "Kerluke LLC"
        end
      end
    end
  end
end
