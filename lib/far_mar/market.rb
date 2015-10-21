require 'csv'

module FarMar
  class Market
    attr_accessor :id, :name, :address, :city, :county, :state, :zip
    def initialize(id, name, address, city, county, state, zip)
      @id = id.to_i
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      #returns a collection of Market instances, representing all of the markets described in the CSV
      market_array = []
      read_file = CSV.read("./support/markets.csv")
      read_file.each do |market|
        list_of_markets = FarMar::Market.new(market[0], market[1], market[2], market[3], market[4], market[5], market[6])
        market_array.push(list_of_markets)
      end
      return market_array
    end

    def self.find(id)
      #returns an instance of Market where the value in the id field of the CSV file matches the passed parameter
      market_array = self.all
      market_array.find {|i| i.id == id}
    end
  end
end
