require "spec_helper"

describe FarMar::Vendor do
  before :each do
     vendor_hash= {
       id: 1,
       name: "Feil-Farrell",
       num_employees: 8,
       market_id: 1
    }

    @vendor = FarMar::Vendor.new(vendor_hash)
  end

  describe "self.new" do
    it "creates a new instance of Vendor" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end


    it "has a name property that is equal to what is passed in" do
      expect(@vendor.name).to eq "Feil-Farrell"
    end

    it "knows about its associated data file" do
      expect(@vendor.vendor_csv).to eq ("./support/vendors.csv")
    end
  end

  describe "self.all" do
    all_vendors = FarMar::Vendor.all
    it "returns an array" do
      expect(all_vendors.class).to eq Array
      #test that it is an array
      expect(all_vendors[0]).to be_an_instance_of FarMar::Vendor
      expect(all_vendors[-1]).to be_an_instance_of FarMar::Vendor
      vendor_csv= CSV.read("./support/vendors.csv")
      expect(all_vendors.length).to eq (vendor_csv.length)
       #all markets length to equal csv.length
    end
  end

  #returns the instance of Market with matching the input # ID
  describe "self.find(id)" do
    it "returns an instance of FarMar::Vendor with its passed in id" do
    expect(FarMar::Vendor.find(1)).to be_an_instance_of FarMar::Vendor
    expect(FarMar::Vendor.find(1).id).to eq 1
    end
  end

  describe ".markets" do
    it "returns an instance of FarMar::Market" do
      expect(@vendor.market).to be_an_instance_of FarMar::Market
    end

    it "returns 6" do
      expect(@vendor.market.name).to eq "People's Co-op Farmers Market"
    end
  end

  describe ".product" do
    it "returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field." do
      expect(FarMar::Product.find(1)).to be_an_instance_of FarMar::Product
      expect(FarMar::Product.find(1).vendor_id).to eq 1
      expect(@vendor.products.class).to eq Array
    end
  end
end
