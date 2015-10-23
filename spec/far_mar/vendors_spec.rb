require "./spec/spec_helper.rb"
require "./lib/far_mar/vendor_class.rb"

describe FarMar::Vendor do

    it "creates a new instace of the vendor class" do
      @vendor_test = FarMar::Vendor.new(4, "name", 12, 21)
      expect(@vendor_test).to be_an_instance_of FarMar::Vendor
    end

  describe "self.all"
    it "returns a collection" do
      expect(FarMar::Vendor.all).to be_an Array
    end
    it "returns all of the vendors listed in the CSV file" do
      expect(FarMar::Vendor.all.length).to eq 816
    end

    describe "self.find_vendor"
      it "retuns an instace of Vendor class" do
        expect(FarMar::Vendor.find_vendor(6)[0]).to be_an_instance_of FarMar::Vendor
      end
      it "returns the instance that matches the given id" do
      @vend_test = FarMar::Vendor.find_vendor(6)[0]
      expect(@vend_test.market_id).to eq "1"
      end

    describe "market"
      it "returns a market instance for the given vendor" do
      @vend_test = FarMar::Vendor.new("9","Quigley, Breitenberg and Schuster","2","2")
        expect(@vend_test.market(9)).to be_an_instance_of FarMar::Market
      end
      it "returns a market instance for the given vendor" do
      @vend_test = FarMar::Vendor.new("9","Quigley, Breitenberg and Schuster","2","2")
        expect(@vend_test.market(9).zip).to eq "98383"
      end

    describe "products"
      it "returns instances for the products of a given vendor" do
        @vend_test = FarMar::Vendor.new("9","Quigley, Breitenberg and Schuster","2","2")
        expect(@vend_test.products(9)[0]).to be_an_instance_of FarMar::Product
      end

    describe "sales"
      it "returns information for the sales associated with a given vendor" do
        @vend_test = FarMar::Vendor.new(13,"Grady, Hudson and Olson",11,4)
        expect(@vend_test.sales(13)[0]).to be_an_instance_of FarMar::Sale
      end

    describe "revenue"
      it "returns the total of all of a given vendor's sales" do
        @vend_test = FarMar::Vendor.new(13,"Grady, Hudson and Olson",11,4)
        expect(@vend_test.revenue(13)).to eq 2848
      end

    describe "self.by_market(market_id)"
      it "gives an array" do
        expect(FarMar::Vendor.by_market(13)).to be_an Array
      end
      it "gives all of the instances of vendor that attend a given market" do
        first_instance = FarMar::Vendor.by_market(13)[0]
        expect(first_instance.id).to eq "54"
      end

end
