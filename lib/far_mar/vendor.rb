# CSV.read('./support/vendors.csv')

module FarMar

	class Vendor
		attr_reader :vendor_id, :name, :employees, :market_id

		def initialize(vendor_id, name, employees, market_id)
			@vendor_id = vendor_id
			@name = name
			@employees = employees
			@market_id = market_id
		end

		

	end

end