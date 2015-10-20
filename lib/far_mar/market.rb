require 'csv'

module FarMar
  class Market
    attr_accessor :id, :name, :address, :city, :county, :state, :zip
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
      #returns a collection of Market instances, representing all of the markets described in the CSV
      market_array = []
      CSV.read("./support/markets.csv").each do |market|
        print market
        list_of_markets = Market.new(market[0], market[1], market[2], market[3], market[4], market[5], market[6])
        market_array.push(list_of_markets)
      end
    end
  end
end
