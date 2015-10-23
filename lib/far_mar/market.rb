require 'csv'

module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip,  :market_csv
    def initialize(market_hash)
      @id = market_hash[:id].to_i
      @name = market_hash[:name]
      @address = market_hash[:address]
      @city = market_hash[:city]
      @county = market_hash[:county]
      @state = market_hash[:state]
      @zip = market_hash[:zip]
      @market_csv = ("./support/markets.csv")

    end


    def self.all
      @@markets_all ||=

        CSV.read("support/markets.csv").map do |row|
          #binding.pry
          FarMar::Market.new({
          id: row[0].to_i,
          name: row[1],
          address: row[2],
          city: row[3],
          county: row[4],
          state: row[5],
          zip: row[6]
        })
      end
    end

    def self.find(id)
      # all_markets = FarMar::Market.all
      all.find do |market|
        market.id == id
      end
    end

    def vendors
      #create an empty array
        #match FarMar::Market id with FarMar:: Vendor id
      FarMar::Vendor.all.find_all do |vendor|
        vendor.market_id == @id
      end
    end
  end
end

#
#
#
#
#
#
#
#
#
#
#
#
# market_hash =
# { id: 1738,
# name: "Newtown",
# address: "123 Fake St. SW",
# city: "Seattle",
# county: "King",
# state: "WA",
# zip: "98146"
# }
