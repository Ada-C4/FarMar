require "spec_helper"

describe FarMar::Market do
  before :each do
    # csv = CSV.read("support/markets.csv")
    @market1 = FarMar::Market.new(:id => 1, :name => "People's Co-op Farmers Market", :address => "30th and Burnside", :city => "Portland", :county => "Multnomah", :state => "Oregon", :zip => 97202)
  end

  describe "initialize" do
    it "creates an instance of a market" do
      expect(@market1).to be_an_instance_of FarMar::Market
      expect(@market1.id).to eq 1
    end
  end

  describe "self.all" do
    it "returns an array of all the markets" do
      expect(FarMar::Market.all.length).to eq 500
    end

    it "reads values correctly" do
      expect(FarMar::Market.all()[24].state).to eq "Illinois"
    end
  end

  describe "self.find" do
    it "returns a market given an id" do
      expect(FarMar::Market.find(4).name).to eq "Preston Farmers’ Market"
    end
  end

  describe "#vendors" do
    # before :each do
    #   @market1 = FarMar::Market.find(1)
    #   @vendor1 = FarMar::Vendor.find(1)
    # end
    # it "returns list of matched vendors to id" do
    #   expect(@market1.vendors).to include (@vendor1)
    # end

    it "returns an array" do
      expect(@market1.vendors).to be_an Array
    end

    it "returns an array of vendors"do
      expect(@market1.vendors.first).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "#products" do
    it "returns an arry" do
      expect(@market1.products).to be_an Array
    end

    it "returns an array of products" do
      expect(@market1.products.first).to be_an_instance_of FarMar::Product
    end
  end

  # describe ".search()" do
  #   before :each do
  #     @search_test = FarMar::Market.search("School")
  #   end
  #   it "returns an array" do
  #     expect(@search_test).to be_an Array
  #   end
  #
  #   it "returns the correct number of items" do
  #     expect(@search_test.length).to eq 3
  #   end
  # end
end
