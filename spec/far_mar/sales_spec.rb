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
        expect(FarMar::Sale.find_sale(8)).to eq ["8", "5727", "2013-11-12 06:03:54 -0800", "2", "2"]
      end

end
