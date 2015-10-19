require 'spec_helper'

describe FarMar::Product do 
	before :each do
		@product = FarMar::Product.new
	end

	it 'can create an instance of a FarMar::Product' do
		expect(@product).to be_an_instance_of(FarMar::Product)
	end

end