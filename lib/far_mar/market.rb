module FarMar
	class Market

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
			market_csv = CSV.read("support/markets.csv")

			markets = []

			market_csv.each do |row|
				market_hash = {:identifier => row[0].to_i, :name => row[1], 
											 :address => row[2], :city => row[3], 
											 :county => row[4], :state => row[5],
											 :zip => row[6]
											}
				markets.push(Market.new(market_hash))
			end

			return markets
		end

		def self.find(id)
			self.all.find do |line|
				line.identifier.to_i == id
			end
		end

		def vendors
			vendor_array = FarMar::Vendor.all 
			vendor_array.find_all { |vendor| vendor.market_id == @identifier}
		end

	end
end