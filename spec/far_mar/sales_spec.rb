require "./spec/spec_helper.rb"
require "./lib/far_mar/sale_class.rb"

describe FarMar::Sale do

  describe "initialize"
    it "creates a new instace of the sale class" do
      @sale_test = FarMar::Sale.new(4, 6789, "2013-11-12 12:00:35 -0800", 6, 12)
      expect(@sale_test).to be_an_instance_of FarMar::Sale
    end

  describe "self.all"
    it "returns an array" do
      expect(FarMar::Sale.all).to be_an Array
    end
    it "returns instances of all the sales described in the CSV" do
      expect(FarMar::Sale.all.length).to eq 935
    end

    describe "self.find_sale"
      it "returns the information for a given sale ID" do
        expect(FarMar::Sale.find_sale(8).amount).to eq "5727"
      end

    describe "vendor"
      it "returns a vendor instance" do
        expect(FarMar::Sale.find_sale(8).vendor).to be_an_instance_of FarMar::Vendor
      end
      it "gives the vendor associated with the sales instance" do
        expect(FarMar::Sale.find_sale(8).vendor.id).to eq "2"
      end

      describe "product"
        it "returns a product instance" do
          expect(FarMar::Sale.find_sale(8).product).to be_an_instance_of FarMar::Product
        end
        it "gives the product associated with the sales instance" do
          expect(FarMar::Sale.find_sale(8).product.id).to eq "2"
        end

      describe "self.between"
        it "returns all of the sales that occured between the parameter times" do
          @beginning_time = DateTime.strptime("2013-11-07 04:34:56 -0800", "%Y-%m-%d %H:%M:%S %z")
          @end_time = DateTime.strptime("2013-11-10 01:51:24 -0800", "%Y-%m-%d %H:%M:%S %z")
          expect(FarMar::Sale.between(@beginning_time, @end_time)).to be_an Array
         expect(FarMar::Sale.between(@beginning_time, @end_time)[0].amount).to eq "9290"
        end
end
