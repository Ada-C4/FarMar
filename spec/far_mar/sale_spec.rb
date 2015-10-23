require "spec_helper"

describe "FarMar::Sale" do
  before :each do
  	sales_hash = {
    	:identifier => 		1,
			:amount => 		 		9290,
			:purchase_time => "2013-11-07 04:34:56 -0800",
			:vendor_id => 		1,
			:product_id => 		1
    }

    @sale = FarMar::Sale.new(sales_hash)
  end

  context "initializing" do
    it "returns a sale object" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

  describe "#self.all" do
  	it "returns collection of Sale instances" do
  		expect(FarMar::Sale.all.class).to eq Array
  	end

  	it "returns all 500 instances" do
  		expect(FarMar::Sale.all.length).to eq 12798
  	end

  	it "returns the data accurately" do 
  		expect(FarMar::Sale.all[0].identifier).to eq 1
  		expect(FarMar::Sale.all[4].identifier).to eq 5
  	end
  end

  describe "#self.find(id)" do 
  	it "returns the id" do 
  		expect(FarMar::Sale.find(2)).to be_an_instance_of FarMar::Sale
  		expect(FarMar::Sale.find(2).amount).to eq 2262
  	end
  end

  describe "#vendor" do 
    it "returns a FarMar::Vendor instance" do 
      expect(@sale.vendor).to be_an_instance_of FarMar::Vendor
      expect(@sale.vendor.name).to eq "Feil-Farrell"
    end
  end

  describe "#product" do 
    it "returns a FarMar::Product instance" do 
      expect(@sale.product).to be_an_instance_of FarMar::Product
      expect(@sale.product.name).to eq "Dry Beets"
    end
  end

  describe "#self.between(begin_time, end_time)" do 
    it "returns objects between two time arguments" do
      expect(FarMar::Sale.between("2013-11-07 05:10:56 -0800", "2013-11-07 05:19:05 -0800").count).to eq 8 
    end
  end

  describe "#self.find_by_x(match)" do 
    it "returns a single instance" do 
      expect(FarMar::Sale.find_by_amount(9290)).to be_an_instance_of FarMar::Sale
      expect(FarMar::Sale.find_by_amount(3444)).to be_an_instance_of FarMar::Sale 
    end

    it "returns the correct instance for the given attribute" do 
      expect(FarMar::Sale.find_by_amount(9290).purchase_time).to eq DateTime.parse("2013-11-07 04:34:56 -0800")
    end
  end

  describe "#self.find_all_by_x(match)" do 
    it "returns an array of instances" do 
      expect(FarMar::Sale.find_all_by_amount(9290)).to be_an Array
      expect(FarMar::Sale.find_all_by_amount(9290)[0]).to be_an_instance_of FarMar::Sale
    end

    it "returns all the correct instance for the given attribute" do 
      expect(FarMar::Sale.find_all_by_amount(9290).length).to eq 5
      expect(FarMar::Sale.find_all_by_amount(9290)[0].purchase_time).to eq DateTime.parse("2013-11-07 04:34:56 -0800")
      expect(FarMar::Sale.find_all_by_purchase_time(DateTime.parse("2013-11-12 00:57:38 -0800"))[0].amount).to eq 9820
    end
  end
end