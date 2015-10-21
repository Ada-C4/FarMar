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
			FarMar::Product.all.find_all { |pro| pro.vendor_id == @vendor_id}
		end

		def self.sales(vendor_id)
			FarMar::Sale.all.find_all { |sale| sale.vendor_id == vendor_id }
		end

	end

end