# CSV.read('./support/markets.csv')

module FarMar

  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

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
      market_array = []
  		CSV.read('./support/markets.csv').each do |row|
        market = FarMar::Market.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
        market_array.push(market)
      end
      return market_array
  	end

  end

end