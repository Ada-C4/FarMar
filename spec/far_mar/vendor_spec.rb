require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new("1","Feil-Farrell","8","1")
end

  describe "new vendor instance" do
    it "creats a new vendor instance" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end


    describe "return a collection of market instances described in CVS" do
      it "returns all of the accounts" do
        expect(FarMar::Vendor.all).to be_an_instance_of Array
      end
    end

    describe "return one account" do
      it "returns one account" do
        expect(FarMar::Vendor.find(1).id).to eq 1
      end
    end


    describe ".get_market" do
      it "returns all accounts withth same vendor id" do
        expect(@vendor.get_market).to be_an_instance_of FarMar::Market
      end
    end


    describe ".get_products" do
      it "returns all accounts with the same vendor id" do
        expect(@vendor.get_products).to be_an_instance_of Array
      end
    end

    describe ".get_sales" do
      it "returns all accounts with the vendor id" do
        expect(@vendor.get_sales).to be_an_instance_of Array
      end
    end

    describe "revenue" do
      it "returns the amount of vendor sales in cents" do
      expect(@vendor.revenue).to eq 38259
    end

    describe ".by_market" do
      it "returns all of the vendors with the given market_id" do
        expect(FarMar::Vendor.by_market(2)).to be_an_instance_of Array
      end
    end
  end
end
