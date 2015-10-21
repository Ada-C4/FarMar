require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new(45,"Hyatt, Conroy and Ortiz",5,10)
    @vendor_2 = FarMar::Vendor.new(2690, "Mann-Lueilwitz", 4, 500)
  end

  context "#initializing" do
    it "creates an instance of @vendor" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
      expect(@vendor_2).to be_an_instance_of FarMar::Vendor
    end
  end

  context ".self.all" do
    it "returns an array" do
      expect(FarMar::Vendor.all().class).to be Array
    end
    it "returns instances of all lines in the csv" do
      expect(FarMar::Vendor.all().length).to eq 2690
    end
  end

  context ".self.find(id)" do
    it "returns an instance of Vendor" do
      expect(@vendor.class).to be FarMar::Vendor
    end

    it "returns an instance with the same id as the value in the CSV file" do
      expect(@vendor.id).to eq 45
      expect(@vendor_2.id).to eq 2690
    end
  end


end
