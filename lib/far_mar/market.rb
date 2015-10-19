# CSV.read('./support/markets.csv')

module FarMar

  class Market

  	def initialize(id, name, address, city, county, state, zip)
  		@id = id
  		@name = name
  		@address = address
  		@city = city
  		@county = county
  		@state = state
  		@zip = zip	
  	end

  	def self.all
  		CSV.read('./support/markets.csv')
  	end

  end

end