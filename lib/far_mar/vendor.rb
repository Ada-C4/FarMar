module FarMar
	class Vendor < LookUp

		attr_accessor :identifier, :name, :no_employees, :market_id

		def initialize(vendor_hash)
			@identifier = 	vendor_hash[:identifier]
			@name = 				vendor_hash[:name]
			@no_employees = vendor_hash[:no_employees]
			@market_id = 		vendor_hash[:market_id]
		end

		def self.all 
			@@vendors ||= []

			if @@vendors == []
				CSV.read("support/vendors.csv").each do |row|
					vendor_hash = {:identifier => row[0].to_i, :name => row[1], 
												 :no_employees => row[2], :market_id => row[3].to_i
												}
					@@vendors.push(Vendor.new(vendor_hash))
				end
			end

			return @@vendors
		end

		def market
			FarMar::Market.all.find { |market| market.identifier == @market_id }
		end

		def products
			FarMar::Product.all.find_all { |product| product.vendor_id == @identifier }
		end

		def sales
			sales_array = FarMar::Sale.sales_by_vendor
			return sales_array[@identifier]
		end

		def self.by_market(market_id)
			vendor_array = []
			self.all.each do |line|
				if line.market_id == market_id
					vendor_array << line
				end
			end
			return vendor_array
		end

		def self.most_revenue(n)
			self.all.max_by(n) { |vendor| vendor.revenue }
		end

		def self.most_items(n)
			self.all.max_by(n) { |vendor| vendor.products.count }
		end

		def self.revenue(date)
			date = DateTime.parse(date)

			revenue_array = []

			self.all.each do |vendor|
				sales = vendor.sales.find_all do |sale|
					if sale.purchase_time.to_date == date 
						revenue_array << sale.amount
					end
				end
			end
			return revenue_array.inject(0) { |sum, amount| sum + amount }
		end

		def revenue_on(date)
			date = DateTime.parse(date)

			revenue_array = []

			sales.each do |sale|
				if sale.purchase_time.to_date == date 
					revenue_array << sale.amount
				end
			end
			
			return revenue_array.inject(0) { |sum, amount| sum + amount }
		end
	end
end