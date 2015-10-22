require "spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new(45, "Hyatt, Conroy and Ortiz", 5, 10)
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
  
  context "#market" do
    it "returns an instance of FarMar::Market associated with the vendor" do
      expect(@vendor.market.length).to eq 1
      expect(@vendor_2.market.length).to eq 1
    end
  end

  context "#products" do
    it "returns a collection of FarMar::Product product instances" do
      expect(@vendor.products.class).to be Array
    end
  end

  context "#sales" do
    it "returns a collection of FarMar::Sale sale instances" do
      expect(@vendor.sales.class).to be Array
    end
  end

end
