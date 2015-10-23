module FarMar
	class Market < LookUp

		attr_accessor :identifier, :name, :address, :city, :county, :state, :zip

		def initialize(market_hash)
			@identifier = market_hash[:identifier]
			@name = 			market_hash[:name]
			@address = 		market_hash[:address]
			@city = 			market_hash[:city]
			@county = 		market_hash[:county]
			@state = 			market_hash[:state]
			@zip = 				market_hash[:zip]
		end

		def self.all
			@@markets ||= []

			if @@markets = []
				CSV.read("support/markets.csv").each do |row|
					market_hash = {:identifier => row[0].to_i, :name => row[1], 
												 :address => row[2], :city => row[3], 
												 :county => row[4], :state => row[5],
												 :zip => row[6]
												}
					@@markets.push(Market.new(market_hash))
				end
			end

			return @@markets
		end

		def vendors
			FarMar::Vendor.all.find_all { |vendor| vendor.market_id == @identifier}
		end

		def products
			products = FarMar::Product.all
			product_array = []

			vendors.zip(products).each do |vendor, product|
				if vendor.identifier == product.vendor_id
					product_array.push(product)
				end
			end
			product_array
		end

		def self.search(search_term)
			market_array ||= []

			self.all.find_all do |market|
				if market.name.match(/#{Regexp.escape(search_term)}/i) || market.vendors.any? { |vendor| vendor.name.match(/#{Regexp.escape(search_term)}/i) }
					market_array.push(market)
				end
			end

			return market_array
		end

		def prefered_vendor
			best_vendor = nil
			max_val = 0 

			vendors.each do |vendor|
				if vendor.revenue > max_val
					max_val = vendor.revenue
					best_vendor = vendor
				end
			end

			return best_vendor
		end

		def preferred_vendor_on(date)
			date = DateTime.parse(date)

			vendors.max_by do |vendor|
				sales = vendor.sales.find_all do |sale|
					sale_date = sale.purchase_time.to_date 
					sale_date == date
				end

				sales.inject(0) { |sum, sale| sum + sale.amount }
			end
		end

		def worst_vendor
			worst_vendor = nil 
			min_val = Float::INFINITY

			vendors.each do |vendor|
				if vendor.revenue < min_val
					min_val = vendor.revenue
					worst_vendor = vendor 
				end
			end

			return worst_vendor
		end

		def worst_vendor_on(date)
			date = DateTime.parse(date)

			vendors.min_by do |vendor|
				sales = vendor.sales.find_all do |sale|
					sale_date = sale.purchase_time.to_date 
					sale_date == date
				end

				sales.inject(0) { |sum, sale| sum + sale.amount }
			end
		end
	end
end