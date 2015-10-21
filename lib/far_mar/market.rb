require "csv"
require "pry"

module FarMar
  attr_accessor :id, :name, :address, :city, :county, :state, :zip
  class Market
    def initialize(market_hash)
      @id = market_hash[:id]
      @name = market_hash[:name]
      @address = market_hash[:address]
      @city = market_hash[:city]
      @county = market_hash[:county]
      @state = market_hash[:state]
      @zip = market_hash[:zip]
    end

    def self.all()
      markets_csv = CSV.read("./support/markets.csv")
      markets_array = []
      markets_csv.each do |line|
      new_market = FarMar::Market.new(
      {
        :id => line[0].to_i,
        :name => line[1],
        :address => line[2],
        :city => line[3],
        :county => line[4],
        :state => line[5],
        :zip => line[6]
        }
      )
      markets_array.push(new_market)
    end
    return markets_array
    end

    def self.find(id)
      markets_csv = CSV.read("./support/markets.csv")
      match = markets_csv.find {|market| market[0].to_i == id}
      new_market = FarMar::Market.new(
      {
        :id => match[0].to_i,
        :name => match[1],
        :address => match[2],
        :city => match[3],
        :county => match[4],
        :state => match[5],
        :zip => match[6]
        }
      )
      return new_market
    end


    def id
      return @id
    end

    def find_vendors(market_id)
      #finds all the vendors for a particular market
      #searches the vendor.all objects for the market_id
      vendors_csv = CSV.read("./support/vendors.csv")
      matches = vendors_csv.find_all {|vendor| vendor[3].to_i == market_id}
      # matches is an array
      vendors_array = []
      matches.each do |line|
        vendor = FarMar::Vendor.new({
        :id => line[0].to_i,
        :name => line[1],
        :num_employees => line[2],
        :market_id => line[3].to_i
        })
        vendors_array.push(vendor)
      end
      #vendors_array is an array of Vendor objects
      return vendors_array
    end

  end
end
