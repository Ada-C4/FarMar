require "spec_helper"

describe "FarMar::Product" do
  before :each do
  	product_hash = {
    	:identifier => 1,
			:name => 			"Dry Beets",
			:vendor_id =>  1
    }

    @product = FarMar::Product.new(product_hash)
  end

  context "initializing" do
    it "returns a product object" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

  describe "#self.all" do
  	it "returns collection of product instances" do
  		expect(FarMar::Product.all.class).to eq Array
  	end
  	it "returns all 500 instances" do
  		expect(FarMar::Product.all.length).to eq 8193
  	end
  	it "returns the data accurately" do 
  		expect(FarMar::Product.all[0].identifier).to eq 1
  		expect(FarMar::Product.all[8192].identifier).to eq 8193
  	end
  end

  describe "#self.find(id)" do 
  	it "returns the id" do 
  		expect(FarMar::Product.find(25)).to be_an_instance_of FarMar::Product
  		expect(FarMar::Product.find(25).name).to eq "Helpless Bread"
  	end
  end

  describe "#vendor" do 
    it "returns the FarMar::Vendor instance that is associated with this vendor" do 
      expect(@product.vendor).to be_an_instance_of FarMar::Vendor
      expect(@product.vendor.name).to eq "Feil-Farrell"
    end
  end

  describe "#sales" do 
    it "returns a collection of FarMar::Sale instances" do 
      expect(@product.sales).to be_an Array 
      expect(@product.sales[0]).to be_an_instance_of FarMar::Sale
      expect(@product.sales[0].amount).to eq 9290
    end
  end

  describe "#number_of_sales" do 
    it "returns the number of times this product has been sold" do 
      expect(@product.number_of_sales).to eq 7
    end
  end

  describe "#self.by_vendor(vendor_id)" do 
    it "returns all of the products with the given vendor_id" do 
      expect(FarMar::Product.by_vendor(1)).to be_an Array
      expect(FarMar::Product.by_vendor(1).length).to eq 1
      expect(FarMar::Product.by_vendor(10).length).to eq 5
      expect(FarMar::Product.by_vendor(13).length).to eq 3
    end
  end

  describe "#self.most_revenue(n)" do
    it "returns an array of n values" do
      expect(FarMar::Product.most_revenue(3).length).to eq 3
      expect(FarMar::Product.most_revenue(3)).to be_an Array
      expect(FarMar::Product.most_revenue(3)[0]).to be_an_instance_of FarMar::Product

    end

    it "returns the top n products instances ranked by total revenue" do 
      expect(FarMar::Product.most_revenue(3)[0].name).to eq "Energetic Fruit"
    end
  end

  describe "#self.find_by_x(match)" do 
    it "returns a single instance" do 
      expect(FarMar::Product.find_by_name("dry beets")).to be_an_instance_of FarMar::Product
      expect(FarMar::Product.find_by_name("heavy chicken")).to be_an_instance_of FarMar::Product
      expect(FarMar::Product.find_by_identifier(1)).to be_an_instance_of FarMar::Product      
    end

    it "returns the correct instance for the given attribute" do 
      expect(FarMar::Product.find_by_identifier(1).name).to eq "Dry Beets"
    end
  end

  describe "#self.find_all_by_x(match)" do 
    it "returns an array of instances" do 
      expect(FarMar::Product.find_all_by_name("beets")).to be_an Array
      expect(FarMar::Product.find_all_by_name("beets")[0]).to be_an_instance_of FarMar::Product
    end

    it "returns all the correct instance for the given attribute" do 
      expect(FarMar::Product.find_all_by_name("fierce").length).to eq 27
      expect(FarMar::Product.find_all_by_name("fierce")[0].name).to eq "Fierce Greens"
      expect(FarMar::Product.find_all_by_name("straight").length).to eq 29
    end
  end

end