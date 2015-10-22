require "./spec/spec_helper"

describe FarMar::Market do
  before :each do
    @market1 = FarMar::Market.new(100, "name", "address", "city", "county", "state", "zip")
    @market2 = FarMar::Market.new(400, "name", "address", "city", "county", "state", "zip")
  end
  describe "#initialize" do
    it "creates new instance of market" do
      expect(@market1).to be_instance_of FarMar::Market
      expect(@market2).to be_instance_of FarMar::Market
    end
    it "allows access to id of instance" do
      expect(@market1.id).to eq 100
    end
  end
  describe "#self.all" do
    it "returns an array" do
      expect(FarMar::Market.all).to be_an Array
    end
    it "returns 500 items in array" do
      expect(FarMar::Market.all.length).to eq 500
    end
  end
  describe "#self.find(id)" do
    it "returns an instance of FarMar::Market" do
      expect(FarMar::Market.find(1)).to be_instance_of FarMar::Market
    end
    it "returns correct instance of FarMar::Market" do
      expect(FarMar::Market.find(1).name).to eq "People's Co-op Farmers Market"
      expect(FarMar::Market.find(2).name).to eq "Silverdale Farmers Market"
    end
  end
  describe "#vendors" do
    it "returns an array" do
      expect(@market1.vendors).to be_an Array
    end
    it "returns array of instances of FarMar::Vendor" do
      expect(@market1.vendors[0]).to be_instance_of FarMar::Vendor
      expect(@market1.vendors[-1]).to be_instance_of FarMar::Vendor
    end
    it "returns correct array length" do
      expect(@market1.vendors.length).to eq 6
      expect(@market2.vendors.length).to eq 10
    end
    it "returns correct first instance of FarMar::Vendor" do
      expect(@market1.vendors[0].name).to eq "Schiller-Ledner"
      expect(@market2.vendors[0].name).to eq "McLaughlin-Metz"
    end
  end
  describe "#products" do
    it "returns an array" do
      expect(@market1.products).to be_an Array
    end
    it "returns an array of FarMar::Product instances" do
      expect(@market1.products[0]).to be_instance_of FarMar::Product
    end
    it "returns correct first instance of FarMar::Vendor" do
      expect(@market1.products[0].id).to eq 1594
      expect(@market2.products[0].id).to eq 6370
    end
  end
  describe ".self.search(search_term)" do
    it "returns an array" do
      expect(FarMar::Market.search("School")).to be_an Array
    end
    it "returns an array of FarMar::Market instances" do
      expect(FarMar::Market.search("School")[0]).to be_instance_of FarMar::Market
    end
    it "returns correct num of results in array" do
      expect(FarMar::Market.search("School").length).to eq 3
      expect(FarMar::Market.search("green").length).to eq 54
    end
  end
  describe "#prefered_vendor" do
    it "returns an instance of FarMar::Vendor" do
      expect(@market1.prefered_vendor).to be_instance_of FarMar::Vendor
    end
    it "returns correct instance of FarMar::Vendor" do
      @market3 = FarMar::Market.new(2, "name", "address", "city", "county", "state", "zip")
      expect(@market3.prefered_vendor.id).to eq 8
    end
  end
  describe "#prefered_vendor_on(date)" do
    it "returns an instance of FarMar::Vendor" do
      expect(@market1.prefered_vendor_on("2013-11-10")).to be_instance_of FarMar::Vendor
    end
    it "returns correct instance of FarMar::Vendor" do
      @market3 = FarMar::Market.new(2, "name", "address", "city", "county", "state", "zip")
      expect(@market3.prefered_vendor_on("2013-11-10").id).to eq 7
    end
  end







  describe "#worst_vendor" do
    it "returns an instance of FarMar::Vendor" do
      expect(@market1.worst_vendor).to be_instance_of FarMar::Vendor
    end
    it "returns correct instance of FarMar::Vendor" do
      @market3 = FarMar::Market.new(2, "name", "address", "city", "county", "state", "zip")
      expect(@market3.worst_vendor.id).to eq 9
    end
    # describe "#worst_vendor_on(date)" do
    #   it "returns an instance of FarMar::Vendor" do
    #     expect(@market1.worst_vendor_on("2013-11-10")).to be_instance_of FarMar::Vendor
    #   end
    #   it "returns correct instance of FarMar::Vendor" do
    #     @market3 = FarMar::Market.new(2, "name", "address", "city", "county", "state", "zip")
    #     expect(@market1.worst_vendor_on("2013-11-10").id).to eq 9
    #   end
    # end
  end
end
