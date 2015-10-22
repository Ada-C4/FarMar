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
      @vend_test2 = FarMar::Vendor.new("9","Quigley, Breitenberg and Schuster","2","2")
        expect(@vend_test2.market(9)).to eq ["2", "Silverdale Farmers Market", "98383", "Silverdale", "Kitsap", "Washington", "98383"]
      end

    describe "products"
      it "returns product information for the given vendor" do
        @vend_test2 = FarMar::Vendor.new("9","Quigley, Breitenberg and Schuster","2","2")
        expect(@vend_test2.products(9)).to eq [["19","Jealous Burrito","9"], ["20", "Tall Pretzel", "9"], ["21", "Embarrassed Bread", "9"], ["22", "Purring Beets", "9"]]
      end

end
