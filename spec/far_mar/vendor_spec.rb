require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new("id", "name", "no_of_employees", "market_id")
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
end
