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

	describe '#products' do
		before :each do
			@vendor = FarMar::Vendor.new(12,"Windler Inc",4,3)
		end
		it 'returns all products for a vendor' do
			expect(@vendor.products.length).to eq(3)
		end
		# I feel like I could use let for the length variable, 
		# but I'm having trouble figure it out
		it 'contains only Product instances'do
			length = @vendor.products.length - 1
			expect(@vendor.products[0]).to be_an_instance_of(FarMar::Product)
		end
	end

	describe '#sales' do
		before :each do
			@vendor = FarMar::Vendor.new(12,"Windler Inc",4,3)
		end
		it 'returns all sales per vendor' do
			expect(@vendor.sales.length).to eq(3)
		end
	end

	describe '#revenue' do
		it 'totals sales for Vendor' do
			vendor = FarMar::Vendor.new(51,"Bernier Inc",1,12)
			vendor1 = FarMar::Vendor.new(18,"Von-Hamill",10,5)
			expect(vendor.revenue).to eq(0)
			expect(vendor1.revenue).to eq(9749)
		end
	end

	describe '.by_market(market_id)' do
		it 'returns all Vendors for given market_id' do
			expect(FarMar::Vendor.by_market(1).length).to eq(6)
		end
		it 'returns only instances of Vendors' do
			expect(FarMar::Vendor.by_market(1)[rand(0..5)]).to be_an_instance_of(FarMar::Vendor)
		end
	end

	# Couldn't figure out how to get this to run without taking so long I have to just cancel it.. 
	# describe '.most_revenue(n)' do
	# 	it 'returns top n Vendors by revenue' do
	# 		top_vends = FarMar::Vendor.most_revenue(3)
	# 		expect(top_vends[1].vendor_id).to eq()
	# 	end
	# end

	describe '.most_items(n)' do
		it 'returns an Array' do
			expect(FarMar::Vendor.most_items(3)).to be_an_instance_of(Array)
		end
		it 'returns top n Vendors by most items available for sale' do
			expect(FarMar::Vendor.most_items(3)[0].vendor_id).to eq(10)
		end
	end

	describe 'self.revenue(date)' do
		it 'returns total revenue for a given date' do
			expect(FarMar::Vendor.revenute("2013-11-07")).to eq(9060582)
		end
	end

end