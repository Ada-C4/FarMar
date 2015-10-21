require 'spec_helper'

describe FarMar::Product do

	describe '#initialize' do
		before :each do	
			@product = FarMar::Product.new(14,"Stupendous Carrots",7)
		end
		it 'creates an instance of a FarMar::Product' do
			expect(@product).to be_an_instance_of(FarMar::Product)
		end
		it 'can access #product_id' do
			expect(@product.product_id).to eq(14)
		end
		it 'can access the #vendor_id' do
			expect(@product.vendor_id).to eq(7)
		end
	end

	describe '.all' do
		before :each do
			@product_array = FarMar::Product.all
		end
		it 'returns an array' do
			expect(@product_array).to be_an_instance_of(Array)
		end
		it 'contains only FarMar::Product instances' do
			length = @product_array.length - 1
			expect(@product_array[rand(0..length)]).to be_an_instance_of(FarMar::Product)
		end
		it 'contains all products from CSV' do 
			csv = CSV.read("support/products.csv")
      expect(@product_array.length).to eq csv.length
		end
	end

	describe '.find' do
    it 'returns a matching product instance' do
      expect(FarMar::Product.find(10).name).to eq("Black Apples")
    end
  end

  describe '#vendor' do
  	before :each do
  		@product = FarMar::Product.new(9,"Large Mushrooms",5)
  	end
  	it 'returns Vendor associated with Product' do
  		expect(@product.vendor.name).to eq("Reynolds, Schmitt and Klocko")
  	end
  end

  describe '#sales' do
  	before :each do
  		@product = FarMar::Product.new(9,"Large Mushrooms",5)
  	end
  	it 'returns an array' do
  		expect(@product.sales).to be_an_instance_of(Array)
  	end
  	it 'returns all sales of product' do
  		expect(@product.sales.length).to eq(3)
  	end
  	it 'returns Sales instances' do
  		expect(@product.sales[rand(0..2)]).to be_an_instance_of(FarMar::Sale)
  	end
  end
end