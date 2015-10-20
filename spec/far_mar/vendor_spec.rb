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
		it 'returns the vendor for a given id' do
			vendor = [10,"Kertzmann LLC",11,3]
			expect(FarMar::Vendor.find(10)).to eq(vendor)
		end
	end

end