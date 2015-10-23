require "spec_helper"

describe "FarMar::Market" do
  before :each do
    market_hash = {
    	:identifier => 1,
			:name => 			"People's Co-op Farmers Market",
			:address => 	"30th and Burnside",
			:city => 			"Portland",
			:county => 		"Multnomah",
			:state => 		"OR",
			:zip => 			97202
    }

     market_hash_2 = {
      :identifier => 2,
      :name =>      "Silverdale Farmers Market",
      :address =>   "98192",
      :city =>      "Silverdale",
      :county =>    "Multnomah",
      :state =>     "OR",
      :zip =>       97202
    }

    @market = FarMar::Market.new(market_hash)
    @market_2 = FarMar::Market.new(market_hash_2)
  end

  context "initializing" do
    it "returns a market object" do
      expect(@market).to be_an_instance_of FarMar::Market
    end
  end

  describe "#self.all" do
  	it "returns collection of market instances" do
  		expect(FarMar::Market.all.class).to eq Array
  	end
  	it "returns all 500 instances" do
  		expect(FarMar::Market.all.length).to eq 500
  	end
  	it "returns the data accurately" do 
  		expect(FarMar::Market.all[0].identifier).to eq 1
  		expect(FarMar::Market.all[499].identifier).to eq 500
  	end
  end

  describe "#self.find(id)" do 
  	it "returns the id" do 
  		expect(FarMar::Market.find(2)).to be_an_instance_of FarMar::Market
  		expect(FarMar::Market.find(2).name).to eq "Silverdale Farmers Market"
  	end
  end

  describe "#vendors" do
    it "returns a collection of vendor instances" do 
      vendor = @market.vendors
      expect(vendor).to be_an Array
      expect(vendor[0]).to be_an_instance_of FarMar::Vendor
      expect(vendor.length).to eq 6
    end
  end

  describe "#products" do 
    it "returns Product objects through Vendor class" do 
      expect(@market.products).to be_an Array
      expect(@market.products[0]).to be_an_instance_of FarMar::Product
      expect(@market.products[0].identifier).to eq 1
    end
  end

  describe "#self.search(search_term)" do 
    it "returns a FarMar::Market instance search contains market" do 
      expect(FarMar::Market.search("Petaluma")[0]).to be_an_instance_of FarMar::Market
      expect(FarMar::Market.search("Petaluma")[0].name).to eq "Petaluma Evening Farmers' Market"
      expect(FarMar::Market.search("Petaluma")[0].identifier).to eq 7
    end

    it "returns multiple instances when multiple markets contain search" do 
      expect(FarMar::Market.search("school").length).to eq 3
      expect(FarMar::Market.search("school")[0]).to be_an_instance_of FarMar::Market
    end

    it "returns nothing when search does not contain market" do
      expect(FarMar::Market.search("fjijewialjf").length).to eq 0
    end

    it "returns FarMar::Market instance when seach contains vendor" do 
      expect(FarMar::Market.search("Bechtelar Inc")[0]).to be_an_instance_of FarMar::Market
      expect(FarMar::Market.search("Bechtelar Inc").length).to eq 1
      expect(FarMar::Market.search("Bechtelar Inc")[0].name).to eq "Silverdale Farmers Market"
    end

    it "returns multiple market instances when multiple vendors contain search" do 
      expect(FarMar::Market.search("Cruickshank").length).to eq 11
      expect(FarMar::Market.search("Cruickshank")[0]).to be_an_instance_of FarMar::Market
    end

    it "returns markets when vendors and markets have name" do 
      expect(FarMar::Market.search("green").length).to eq 50
    end
  end

  describe "#prefered_vendor" do
    it "returns the vendor with the highest revenue" do 
      expect(@market_2.prefered_vendor).to be_an_instance_of FarMar::Vendor
      expect(@market_2.prefered_vendor.identifier.class).to eq Fixnum
      expect(@market_2.prefered_vendor.identifier).to eq 8
    end
  end

  describe "#preferred_vendor_on(date)" do 
    it "returns the vendor with the highest revenue for date" do 
      expect(@market_2.preferred_vendor_on("2013-11-07")).to be_an_instance_of FarMar::Vendor
      expect(@market_2.preferred_vendor_on("2013-11-07").identifier).to eq 7
    end
  end

  describe "#worst_vendor" do 
    it "returns the worst vendor" do 
      expect(@market_2.worst_vendor).to be_an_instance_of FarMar::Vendor
      expect(@market_2.worst_vendor.identifier.class).to eq Fixnum
      expect(@market_2.worst_vendor.identifier).to eq 9
    end
  end

  describe "#worst_vendor_on(date)" do 
    it "returns the vendor with the lowest revenue for date" do 
      expect(@market_2.worst_vendor_on("2013-11-07")).to be_an_instance_of FarMar::Vendor
      expect(@market_2.worst_vendor_on("2013-11-07").identifier).to eq 9
    end
  end


  describe "#self.find_by_x(match)" do 
    it "returns a single instance" do 
      expect(FarMar::Market.find_by_name("Silverdale Farmers Market")).to be_an_instance_of FarMar::Market
      expect(FarMar::Market.find_by_identifier(1)).to be_an_instance_of FarMar::Market  
      expect(FarMar::Market.find_by_address("30th and Burnside")).to be_an_instance_of FarMar::Market  
      expect(FarMar::Market.find_by_city("Portland")).to be_an_instance_of FarMar::Market  
      expect(FarMar::Market.find_by_state("OR")).to be_an_instance_of FarMar::Market     
      expect(FarMar::Market.find_by_county("Multnomah")).to be_an_instance_of FarMar::Market 
      expect(FarMar::Market.find_by_zip("97202")).to be_an_instance_of FarMar::Market        
      expect(FarMar::Market.find_by_name("Silverdale Farmers Market")).to be_an_instance_of FarMar::Market
    end

    it "returns the correct instance for the given attribute" do 
      expect(FarMar::Market.find_by_name("silverdale").name).to eq "Silverdale Farmers Market"
      expect(FarMar::Market.find_by_name("silverdale").city).to eq "Silverdale"
      expect(FarMar::Market.find_by_name("silverdale").address).to eq "98383"
      expect(FarMar::Market.find_by_identifier(5).name).to eq "Quincy Farmers Market"
    end

    it "doesn't return anything when there is no attribute" do 
      expect(FarMar::Market.find_by_identifier(234989304)).to eq nil
    end

  end


  describe "#self.find_all_by_x(match)" do 
    it "returns an array of instances" do 
      expect(FarMar::Market.find_all_by_name("mobile")).to be_an Array
      expect(FarMar::Market.find_all_by_name("Silverdale Farmers Market")[0]).to be_an_instance_of FarMar::Market
    end

    it "returns all the correct instance for the given attribute" do 
      expect(FarMar::Market.find_all_by_name("mobile").length).to eq 3
      expect(FarMar::Market.find_all_by_state("Louisiana").length).to eq 6
    end
  end
end