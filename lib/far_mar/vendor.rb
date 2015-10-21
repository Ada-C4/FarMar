# CSV.read('./support/vendors.csv')

module FarMar

	class Vendor
		attr_reader :vendor_id, :name, :employees, :market_id

		def initialize(vendor_id, name, employees, market_id)
			@vendor_id = vendor_id.to_i
			@name = name
			@employees = employees
			@market_id = market_id.to_i
		end

		def self.all
			vendor_array = []
			  CSV.read('./support/vendors.csv').each do |row|
        	vendor = FarMar::Vendor.new(row[0], row[1], row[2], row[3])
        	vendor_array.push(vendor)
      end
      return vendor_array
		end

		def self.find(id)
 			FarMar::Vendor.all.find {|ven| ven.vendor_id == id}
		end

	end

end