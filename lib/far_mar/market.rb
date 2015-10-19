module FarMar
	class Market
		def initialize
			

			#returns a collection of Market instances, 
			#representing all of the markets described 
			#in the CSV
		end

		def self.find(id)
			#returns an instance of Market where the 
			#value of the id field in the CSV matches the 
			#passed parameter
		end

		def vendors
			#returns a collection of vendor 
			#instances that are associated with 
			#the market by the market_id field
		end

	end
end