require "spec_helper"

describe FarMar::Market do
  before :each do
    @csv = CSV.read("support/markets.csv")
    @market1 = FarMar::Market.new(:id => 1, :name => "People's Co-op Farmers Market", :address => "30th and Burnside", :city => "Portland", :county => "Multnomah", :state => "Oregon", :zip => 97202)
    @market2 = FarMar::Market.new(:id => 2, :name => "Silverdale Farmers Market", :address => "98383", :city => "Silverdale", :county => "Kitsap", :state => "Washington", :zip => 98383)
    @market13 = FarMar::Market.new(:id => 13, :name => "Otsiningo Park Farmers' Market", :address => "1 Bevier St,Binghamton", :city => "Binghamton", :county => "Broome", :state => "New York", :zip => 13905)
  end

  describe "initialize" do
    it "creates an instance of a market" do
      expect(@market1).to be_an_instance_of FarMar::Market
      expect(@market13.id).to eq 13
    end
  end

  describe "self.all" do
    it "returns an array of all the markets" do
      expect(FarMar::Market.all.length).to eq @csv.length
    end

    it "returns values correctly" do
      expect(FarMar::Market.all()[24].state).to eq "Illinois"
    end
  end

  describe "self.find" do

    it "returns a market" do
      expect(FarMar::Market.find(400)).to be_an_instance_of FarMar::Market
    end

    it "returns a market given an id" do
      expect(FarMar::Market.find(4).name).to eq "Preston Farmers’ Market"
    end

    it "really does that" do
      expect(FarMar::Market.find(13).id).to eq 13
    end
  end

  describe "#vendors" do
    it "returns an array" do
      expect(@market1.vendors).to be_an Array
    end

    it "returns an array of vendors" do
      expect(@market1.vendors.first).to be_an_instance_of FarMar::Vendor
    end

  end

  describe "#products" do
    it "returns an array" do
      expect(@market1.products).to be_an Array
    end

    it "returns an array of products" do
      expect(@market1.products.first).to be_an_instance_of FarMar::Product
    end

    it "returns all the products associated with a market" do
      expect(@market13.products.length).to eq 26
    end
  end

  describe ".search()" do
    before :each do
      @search_test = FarMar::Market.search("School")
    end

    it "returns an array" do
      expect(@search_test).to be_an Array
    end

    it "returns the correct number of items" do
      expect(@search_test.length).to eq 3
    end

    it "returns Markets or Vendors" do
      expect(@search_test.first).to be_an_instance_of FarMar::Market || FarMar::Vendor
    end
  end

  describe "#pref_vendor" do
    it "returns a vendor object" do
      expect(@market1.pref_vendor).to be_an_instance_of FarMar::Vendor
    end

    it "returns a vendor with the highest revenue" do
      expect(@market13.pref_vendor.id).to eq 54
    end
  end

  # describe "#preferred_vendor(date)"do
  #   it "returns a vendor correctly" do
  #     expect(@market2.preferred_vendor(Date.parse("2013-11-07")).id).to eq 7
  #   end
  # end
end
