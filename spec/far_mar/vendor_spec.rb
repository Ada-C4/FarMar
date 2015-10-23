require "spec_helper"

describe "FarMar::Vendor" do
  before :each do
  	vendor_hash = {
    	:identifier => 	 2,
			:name => 				 "Feil-Farrell",
			:no_employees => 8,
			:market_id =>  	 3
    }

    vendor_hash_2 = {
      :identifier =>   1,
      :name =>         "Rando Market",
      :no_employees => 20,
      :market_id =>    28
    }

    vendor_hash_3 = {
      :identifier =>   3,
      :name =>         "Another Rando Market",
      :no_employees => 20,
      :market_id =>    28
    }

    @vendor = FarMar::Vendor.new(vendor_hash)
    @vendor_2 = FarMar::Vendor.new(vendor_hash_2)
    @vendor_3 = FarMar::Vendor.new(vendor_hash_3)
  end

  context "initializing" do
    it "returns a vendor object" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "#self.all" do
  	it "returns collection of vendor instances" do
  		expect(FarMar::Vendor.all.class).to eq Array
  	end
  	it "returns all 500 instances" do
  		expect(FarMar::Vendor.all.length).to eq 2690
  	end
  	it "returns the data accurately" do 
  		expect(FarMar::Vendor.all[0].identifier).to eq 1
  		expect(FarMar::Vendor.all[2689].identifier).to eq 2690
  	end
  end

  describe "#self.find(id)" do 
  	it "returns the id" do 
  		expect(FarMar::Vendor.find(25)).to be_an_instance_of FarMar::Vendor
  		expect(FarMar::Vendor.find(25).name).to eq "Veum, Dickinson and Conroy"
  	end
  end

  describe "#market" do
    it "is an Object" do
      market_vendor = @vendor.market
      expect(market_vendor).to be_an Object
      expect(market_vendor).to be_an_instance_of FarMar::Market
    end

    it "returns the FarMar::Market instance associated with the FarMar::Vendor" do
      market_vendor_1 = @vendor.market
      market_vendor_2 = @vendor_2.market

      expect(market_vendor_1.identifier).to eq 3 # returns the market_id instead of the vendor_id
      expect(market_vendor_2.identifier).to eq 28
    end
  end

  describe "#products" do
    it "returns a collection of product instances" do
      product = @vendor.products 
      expect(product).to be_an Array
      expect(product.length).to eq 2
    end
  end

  describe "#sale" do
    it "returns a collection of sale instances" do
      sale = @vendor.sales 
      expect(sale).to be_an Array
      expect(sale.length).to eq 1
    end
  end

  describe "#revenue" do 
    it "returns the sum of sales" do 
      expect(@vendor.revenue).to eq 5727
      expect(@vendor_2.revenue).to eq 38259
    end
  end

  describe "#self.by_market(market_id)" do 
    it "returns all the vendors w given market id" do 
      expect(FarMar::Vendor.by_market(3)).to be_an Array
      expect(FarMar::Vendor.by_market(3).length).to eq 3
      expect(FarMar::Vendor.by_market(10).length).to eq 9
      expect(FarMar::Vendor.by_market(1).length).to eq 6
    end
  end

  describe "#self.most_revenue(n)" do 
    it "returns an Array of length n" do 
      expect(FarMar::Vendor.most_revenue(1)).to be_an Array 
      expect(FarMar::Vendor.most_revenue(4).length).to eq 4
      expect(FarMar::Vendor.most_revenue(10).length).to eq 10
      expect(FarMar::Vendor.most_revenue(0).length).to eq 0

    end

    it "returns the top n vendor instances ranked by total revenue" do
      expect(FarMar::Vendor.most_revenue(4)[0].name).to eq "Swaniawski-Schmeler"
      expect(FarMar::Vendor.most_revenue(3)[0].revenue).to be > FarMar::Vendor.most_revenue(3)[1].revenue
      expect(FarMar::Vendor.most_revenue(2690)[2689].name).to eq "Homenick, Ryan and Corwin"
    end
  end

  describe "#self.most_items(n)" do 
    it "returns an Array of length n" do 
      expect(FarMar::Vendor.most_items(2)).to be_an Array
      expect(FarMar::Vendor.most_items(4).length).to eq 4
    end

    it "returns the top n vendor instances ranked by total number of items sold" do 
      expect(FarMar::Vendor.most_items(4)[0].name).not_to eq "Swaniawski-Schmeler"
      expect(FarMar::Vendor.most_items(4)[0].name).to eq "Rolfson-Willms"
    end
  end

  describe "#self.revenue(date)" do 
    it "returns the total revenue for that date across all vendors" do 
      expect(FarMar::Vendor.revenue("2013-11-07").class).to eq Fixnum
      expect(FarMar::Vendor.revenue("2013-11-07")).to eq 9060582
      expect(FarMar::Vendor.revenue("2013-11-08")).to eq 9278492      
    end
  end

  describe "#revenue_on(date)" do 
    it "returns the total revenue for that specific purchase date and vendor instance" do 
      expect(@vendor.revenue_on("2013-11-07")).to be_an Fixnum
      expect(@vendor.revenue_on("2013-11-07")).to eq 0
      expect(@vendor_2.revenue_on("2013-11-12")).to eq 4095
      expect(@vendor_3.revenue_on("2013-11-08")).to eq 10339
    end
  end

  describe "#self.find_by_x(match)" do 
    it "returns a single instance" do 
      expect(FarMar::Vendor.find_by_name("Schmitt Group")).to be_an_instance_of FarMar::Vendor
      expect(FarMar::Vendor.find_by_no_employees("8")).to be_an_instance_of FarMar::Vendor 
    end

    it "returns the correct instance for the given attribute" do 
      expect(FarMar::Vendor.find_by_name("Bernhard-Harber").identifier).to eq 31
      expect(FarMar::Vendor.find_by_name("Schmitt Group").market_id).to eq 8    
    end
  end

  describe "#self.find_all_by_x(match)" do 
    it "returns an array of instances" do 
      expect(FarMar::Vendor.find_all_by_name("Schmitt Group")).to be_an Array
      expect(FarMar::Vendor.find_all_by_name("Schmitt Group")[0]).to be_an_instance_of FarMar::Vendor
    end

    it "returns all the correct instance for the given attribute" do 
      expect(FarMar::Vendor.find_all_by_name("group").length).to eq 252
      expect(FarMar::Vendor.find_all_by_market_id(8).length).to eq 6
      expect(FarMar::Vendor.find_all_by_name("feil")[0].name).to eq "Feil-Farrell"
    end
  end
end