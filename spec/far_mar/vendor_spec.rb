require "spec_helper"

describe FarMar::Vendor do
  before :each do
    v_hash = {id: "1", name: "Feil-Farrell", employees: "8", market_id: "1"}
    @vendor = FarMar::Vendor.new(v_hash)
  end

  describe ".new" do
    it "creates a new instance of Vendor" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "#all" do
    all_vendors = FarMar::Vendor.all
    it "returns a collection of all vendor instances in the csv" do
      expect(all_vendors.class).to eq Array
      expect(all_vendors[0]).to be_an_instance_of FarMar::Vendor
      expect(all_vendors[-1]).to be_an_instance_of FarMar::Vendor
      csv = CSV.read("support/vendors.csv")
      expect(all_vendors.length).to eq csv.length
    end
  end

  describe "#find" do
    it "returns the instance of Vendor matching the input id" do
      expect(FarMar::Vendor.find(1)).to be_an_instance_of FarMar::Vendor
      expect(FarMar::Vendor.find(2).name).to eq "Hamill, Kilback and Pfeffer"
    end
  end

  describe ".market" do
    it "returns the Market instance from the csv that is associated with this vendor" do
      expect(@vendor.market).to be_an_instance_of FarMar::Market
      expect(@vendor.market.name).to eq "People's Co-op Farmers Market"
    end
  end


end
