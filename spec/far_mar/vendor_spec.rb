require 'spec_helper'

describe FarMar::Vendor do 
	
	describe 'initialize' do
		before :each do
			@vendor = FarMar::Vendor.new(30,"Koelpin, Koelpin and Wintheiser",10,9)
		end
		it 'can create an instance of a FarMar::Vendor' do
			expect(@vendor).to be_an_instance_of(FarMar::Vendor)
		end
		it 'can retrieve the id of a given instance' do
			expect(@vendor.id).to eq(30)
		end
	end

end