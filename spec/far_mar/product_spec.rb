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

end