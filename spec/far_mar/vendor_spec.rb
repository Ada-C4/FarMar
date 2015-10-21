require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new(45,"Hyatt, Conroy and Ortiz",5,10)
  end

  context "#initializing" do
    it "creates an instance of @vendor" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
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
end
