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

	describe '.find(id)' do
		it 'returns a matching market instance' do
			expect(FarMar::Market.find(16).zip).to eq("60546")
		end
	end

	describe 'vendors' do
		before :each do
			@market = FarMar::Market.new(7,"Petaluma Evening Farmers' Market","1 2nd Street","Petaluma","Sonoma","California",94952)
		end
		it 'returns an array' do
		  expect(@market.vendors).to be_an_instance_of(Array)
		end
		it 'returns all FarMar::Vendor instances for a market id' do
			expect(@market.vendors.length).to eq(2)
		end
	end

	describe '#products' do
		before :each do
			@market = FarMar::Market.new(2,"Silverdale Farmers Market",98383,"Silverdale","Kitsap","Washington",98383)
		end
		it 'returns FarMar::Product instances' do
			expect(@market.products[0]).to be_an_instance_of(FarMar::Product)
		end
		it 'returns an array' do
			expect(@market.products).to be_an_instance_of(Array)
		end
		it 'returns all products sold at the Market' do
			expect(@market.products.length).to eq(9)
		end
	end

	describe '.search(search_term)' do
		before :each do
			@search_return = FarMar::Market.search("school")
		end
		it 'returns an array' do
			expect(@search_return).to be_an_instance_of(Array)
		end
		it 'contains Market Instances' do
			expect(@search_return[0]).to be_an_instance_of(FarMar::Market)
		end
		it 'returns Markets w search_term in @name' do
			expect(@search_return.length).to eq(3)
		end
		it 'returns Markets w search term in Vendor @name' do
			@search = FarMar::Market.search("Donnelly")
			expect(@search.length).to eq(18)
			expect(@search[0].market_id).to eq(3)
		end	
	end

	describe '#preferred_vendor' do
		before :each do
			@market = FarMar::Market.new(2,"Silverdale Farmers Market",98383,"Silverdale","Kitsap","Washington",98383)
		end
		it 'returns a Vendor' do
			expect(@market.preferred_vendor).to be_an_instance_of(FarMar::Vendor)
		end
		it 'returns Vendor with highest revenue' do
			expect(@market.preferred_vendor.name).to eq("Stamm Inc")
		end
	end

	describe 'preferred_vendor_by_date(date)' do
		before :each do
			@market = FarMar::Market.new(2,"Silverdale Farmers Market",98383,"Silverdale","Kitsap","Washington",98383)
		end
		it 'returns a Vendor' do
			expect(@market.preferred_vendor_by_date("2013-11-10")).to be_an_instance_of(FarMar::Vendor)
		end
		it 'returns Vendor w highest revenue for date' do
			@pref_vend = @market.preferred_vendor_by_date("2013-11-10")
			expect(@pref_vend.vendor_id).to eq(7)
		end
	end

	describe 'worst_vendor' do
		before :each do
		@market = FarMar::Market.new(2,"Silverdale Farmers Market",98383,"Silverdale","Kitsap","Washington",98383)
		end
		it 'returns a Vendor' do
			expect(@market.worst_vendor).to be_an_instance_of(FarMar::Vendor)
		end
		it 'returns the Vendor with lowest revenue' do
			expect(@market.worst_vendor.name).to eq("Quigley, Breitenberg and Schuster")
		end
	end

end