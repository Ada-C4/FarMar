require 'spec_helper'

describe FarMar::Market do 

	describe '#initialize' do
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

	describe '.all' do	
		before :each do
			@market_array = FarMar::Market.all
		end
		it 'returns an array' do
			expect(@market_array).to be_an_instance_of(Array)
		end
		it 'contains only FarMar::Market instances' do
			length = @market_array.length - 1
			expect(@market_array[rand(0..length)]).to be_an_instance_of(FarMar::Market)
		end
		it 'contains all data from CSV file' do
			csv = CSV.read("support/markets.csv")
			expect(@market_array.length).to eq(csv.length)
		end
	end

end