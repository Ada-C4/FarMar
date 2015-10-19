require 'spec_helper'

describe FarMar::Market do 

	describe 'initialize' do
	  before :each do
		  @market = FarMar::Market.new(1,"People's Co-op Farmers Market","30th and Burnside","Portland","Multnomah","Oregon",97202)
	  end

	  it 'can create an instance of a FarMar::Market' do
		  expect(@market).to be_an_instance_of(FarMar::Market)
	  end
	  it 'can retrieve the name of the market instance' do
		  expect(@market.name).to eq ("People's Co-op Farmers Market")
	  end
	  it 'assigns the proper variable to state' do
	  	expect(@market.state).to eq("Oregon")
	  end
	end

	describe 'self.all' do	
		before :each do
			@market_array = FarMar::Market.all
		end
		it 'returns an array of Market instances' do
			expect(@market_array).to be_an_instance_of(Array)
		end
		it 'contains all the markets in the CSV file' do

		end
	end


end