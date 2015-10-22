require "spec_helper"

describe FarMar::Vendor do
  before :each do
     vendor_hash= {
       id: 1500,
       name: "Remlinger Farms",
       num_employees: 8,
       market_id: 321
    }
    @vendor = FarMar::Vendor.new(vendor_hash)
  end

  describe "self.new" do
    it "creates a new instance of Vendor" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  

    it "has a name property that is equal to what is passed in" do
      expect(@vendor.name).to eq "Remlinger Farms"
    end

    it "knows about its associated data file" do
      expect(@vendor.vendor_csv).to eq ("./support/vendors.csv")
    end
  end
end
