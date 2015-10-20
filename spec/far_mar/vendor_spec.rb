require "spec_helper"

describe FarMar::Vendor do
  before :each do
    row = [1, "Name", 10, 5]
    @vendor = FarMar::Vendor.new(row[0], row[1], row[2], row[3])
  end
  describe ".new" do
    it "creates a new instance of Vendor" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end
  describe "#initialize" do
    it "creates a new instance of Vendor with 4 instance variables" do
      expect(@vendor.instance_variables.length).to eq 4
    end
    it "creates a new instance of Vendor with @id as an integer" do
      expect(@vendor.id.class).to eq Fixnum
    end
  end
  describe "self.all" do
    it "returns an array of Vendor instances" do
      expect(FarMar::Vendor.all).to be_an Array
    end
    it "returns an array with 2690 Vendor instances" do
      expect(FarMar::Vendor.all.length).to eq 2690
    end
  end
  describe "self.find(id)" do
    it "returns the corresponding vendor name for a particular vendor id" do
      @id = 2608
      expect(FarMar::Vendor.find(@id).name).to eq "Funk and Sons"
    end
    it "returns the corresponding Market name for a particular vendor" do
      @id = 2188
      expect(FarMar::Market.find(FarMar::Vendor.find(@id).market_id).name). to eq "Selma/Dallas County Farmers Market"
    end
  end
end
