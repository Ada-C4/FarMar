require 'spec_helper'

describe FarMar::Vendor do 
	
	describe '#initialize' do
		before :each do
			@vendor = FarMar::Vendor.new(30,"Koelpin, Koelpin and Wintheiser",10,9)
		end
		it 'can create an instance of a FarMar::Vendor' do
			expect(@vendor).to be_an_instance_of(FarMar::Vendor)
		end
		it 'can retrieve the id of a given instance' do
			expect(@vendor.vendor_id).to eq(30)
		end
	end

	describe '.all' do
		before :each do
			@vendor_array = FarMar::Vendor.all
		end
		it 'returns an array' do
			expect(@vendor_array).to be_an_instance_of(Array)
		end
		it 'contains same number of vendors as orginal file' do
			csv = CSV.read("support/vendors.csv")
			expect(@vendor_array.length).to eq(csv.length)
		end
		it 'only contains FarMar::Vendor instances' do
			length = @vendor_array.length - 1
			expect(@vendor_array[rand(0..length)]).to be_an_instance_of(FarMar::Vendor)
		end
	end

	describe '.find(id)' do
		it 'returns a vendor instance' do
			expect(FarMar::Vendor.find(10).name).to eq("Kertzmann LLC")
		end
	end

	describe '#market' do
		vendor = FarMar::Vendor.new(5,"Reynolds, Schmitt and Klocko",3,1)
		it 'returns the market associated with Vendor instance' do
			expect(vendor.market).to eq(1)
		end
	end

	describe '.products()' do
		it 'returns an array' do
			length = FarMar::Vendor.all.length - 1
			expect(FarMar::Vendor.products(rand(0..length))).to be_an_instance_of(Array)
		end
		it 'returns all products for a vendor' do
			expect(FarMar::Vendor.products(5).lenght).to eq(3)
		end
	end

end