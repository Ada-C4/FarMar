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
      it "retuns the information for a given vendor based on that vendor's ID" do
        expect(FarMar::Vendor.find_vendor(6)).to eq ["6", "Zulauf and Sons", "8", "1"]
      end

    describe "market"
      it "returns a market information for the given vendor" do
      @vend_test = FarMar::Vendor.new("9","Quigley, Breitenberg and Schuster","2","2")
        expect(@vend_test.market(9)).to eq ["2", "Silverdale Farmers Market", "98383", "Silverdale", "Kitsap", "Washington", "98383"]
      end

    describe "products"
      it "returns information for the products of a given vendor" do
        @vend_test = FarMar::Vendor.new("9","Quigley, Breitenberg and Schuster","2","2")
        expect(@vend_test.products(9)).to eq [["19","Jealous Burrito","9"], ["20", "Tall Pretzel", "9"], ["21", "Embarrassed Bread", "9"], ["22", "Purring Beets", "9"]]
      end

    describe "sales"
      it "returns information for the sales associated with a given vendor" do
        @vend_test = FarMar::Vendor.new(13,"Grady, Hudson and Olson",11,4)
        expect(@vend_test.sales(13)).to eq [["69", "10", "2013-11-10 00:03:56 -0800", "13", "38"], [
        "70", "2838", "2013-11-09 13:30:15 -0800", "13", "38"]]
      end

    describe "revenue"
      it "returns the total of all of a given vendor's sales" do
        @vend_test = FarMar::Vendor.new(13,"Grady, Hudson and Olson",11,4)
        expect(@vend_test.revenue(13)).to eq 2848
      end

    describe "self.by_market(market_id)"
      it "gives all of the vendors that attend a given market" do
        expect(FarMar::Vendor.by_market()).to eq [["10","Kertzmann LLC"],["11", "Donnelly-Quigley"],[
        "12","Windler Inc"]]
      end

end
