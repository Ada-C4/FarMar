require 'spec_helper'

describe FarMar::Market do 
	before :each do
		@market = FarMar::Market.new
	end

	it 'can create an instance of a FarMar::Market' do
		expect(@market).to be_an_instance_of(FarMar::Market)
	end

end