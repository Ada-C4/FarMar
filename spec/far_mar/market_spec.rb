# Wherever I was when I ran RSpec, look inside that directory. When running RSpec, the require knows to look inside the spec folder...
require "spec_helper"

describe FarMar::Market do
  before :each do
    row = [1,"Name", "Address", "City", "County", "State", "Zip"]
    @market = FarMar::Market.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
  end
  describe ".new" do
    it "creates a new instance of Market" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end
  describe "#initialize" do
    it "creates instance variables" do
      expect(@market.instance_variables.length).to eq 7
    end
    it "creates @id as an integer" do
      expect(@market.id.class).to eq Fixnum
    end
  end
  describe "self.all" do
    it "returns an array of all Market instances" do
      expect(FarMar::Market.all).to be_an Array
    end
  end
  describe "self.find(id)" do
    it "finds a market using its ID" do
      @id = 400
      expect(FarMar::Market.find(@id).id).to eq FarMar::Market.find(@id).id
    end
  end
  describe "#vendors" do
    it "returns an array" do
      @id = 1
      @market = FarMar::Market.find(@id)
      expect(@market.vendors).to be_an Array
    end
    it "creates an array with Vendor instances" do
      expect(@market.vendors[0]).to be_an_instance_of FarMar::Vendor
    end
  end
  describe "#products" do
    it "returns an array" do
      @id = 1
      @market = FarMar::Market.find(@id)
      expect(@market.products).to be_an Array
    end
    it "creates an array of Product instances" do
      expect(@market.products[0]).to be_an_instance_of FarMar::Product
    end
  end
  describe "#self.search(search_term)" do
    it "creates an array" do
      expect(FarMar::Market.search("Donnelly")).to be_an Array
    end
    it "returns an array with Market instances" do
      expect(FarMar::Market.search("Donnelly")[0]).to be_an_instance_of FarMar::Market
      expect(FarMar::Market.search("toy and sons")[0]).to be_an_instance_of FarMar::Market
      expect(FarMar::Market.search("Donnelly").length).to be < FarMar::Market.all.length
    end
  end
  describe "#preferred_vendor" do
    it "returns the vendor with the highest revenue" do
      @id = 1
      @market = FarMar::Market.find(@id)
      expect(@market.preferred_vendor).to be_an_instance_of FarMar::Vendor
    end
  end
  describe "#vendor_of_the_day(date)" do
    it "returns the preferred vendor for a specific date" do
      @id = 1
      @market = FarMar::Market.find(@id)
      @date = "2013-11-07 04:34:56 -0800"
      expect(@market.vendor_of_the_day(@date)).to be_an_instance_of FarMar::Vendor
    end
  end
end
