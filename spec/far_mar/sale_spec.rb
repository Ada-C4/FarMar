require 'spec_helper'

describe FarMar::Sale do 
	before :each do
		@sale = FarMar::Sale.new
	end

	it 'can create an instance of a FarMar::Sale' do
		expect(@sale).to be_an_instance_of(FarMar::Sale)
	end

end