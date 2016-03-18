# CSV.read('./support/vendors.csv')

module FarMar

	class Vendor
		attr_reader :vendor_id, :name, :employees, :market

		def initialize(vendor_id, name, employees, market)
			@vendor_id = vendor_id.to_i
			@name = name
			@employees = employees
			@market = market.to_i
		end

		def self.all
			@@vendor_array ||= []
			  if @@vendor_array == []
			  	CSV.read('./support/vendors.csv').each do |row|
        		vendor = FarMar::Vendor.new(row[0], row[1], row[2], row[3])
        		@@vendor_array.push(vendor)
      		end
      	end
      return @@vendor_array
		end

		def self.find(vendor_id)
 			FarMar::Vendor.all.find {|ven| ven.vendor_id == vendor_id}
		end

		def products
			FarMar::Product.all.find_all {|pro| pro.vendor_id == @vendor_id}
		end

		def sales
			sales_hash = FarMar::Sale.sales_by_vendor
			return sales_hash[@vendor_id]
		end

		def revenue
			sales_array = self.sales
			total = 0
			sales_array.each do |sale|
			#	binding.pry
				total += sale.amount
			end
			return total
		end

		def self.by_market(market_id)
			FarMar::Vendor.all.find_all {|ven| ven.market == market_id }
		end

		# Couldn't figure out how to rewrite this to get it to run in a decent amount of time
		# def self.most_revenue(n)
		# 	top_vendors = @@vendor_array.sort_by{|ven| ven.revenue}
		# 	return top_vendors[0..n]
		# end

		def self.most_items(n)
			most_items = 0
			vendors_by_items = []
			vendor_array = @@vendor_array.dup
			n.times do
				vendor = vendor_array.max_by{|ven| ven.products.length}
				vendors_by_items.push(vendor)
				vendor_array.delete(vendor)
			end
			return vendors_by_items
		end

		# This method is currently taking too long to run; I can't even get the tests to finish on it. Not sure if I'll have the time to retool it
		# def self.revenue(date)
		# 	date = DateTime.strptime(date, "%Y-%m-%d").to_date
		# 	revenue = 0
		# 	FarMar::Vendor.all.each do |vendor_inst|
		# 		vendor_inst.sales.each do |sale_inst|
  #         if sale_inst.purchase_time.to_date == date
  #           revenue += sale_inst.amount
  #         end
  #       end
		# 	end
		# 	return revenue
		# end

	end

end