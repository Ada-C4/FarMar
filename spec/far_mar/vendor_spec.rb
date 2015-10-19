require 'spec_helper'

describe FarMar::Vendor do 
	before :each do
		@vendor = FarMar::Vendor.new
	end

	it 'can create an instance of a FarMar::Vendor' do
		expect(@vendor).to be_an_instance_of(FarMar::Vendor)
	end

end